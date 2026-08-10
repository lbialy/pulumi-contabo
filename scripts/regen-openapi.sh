#!/usr/bin/env bash
#
# Regenerates the vendored Contabo OpenAPI client in provider/cntb/openapi.
#
# The upstream terraform-provider-contabo declares `contabo.com/openapi` as a
# dependency but git-ignores the generated sources and never publishes them as a
# module, so every consumer has to generate the client itself and wire it up with
# a `replace` directive. That is what provider/cntb/openapi is: a checked-in copy
# generated the same way upstream's `make generate-api-clients` does it.
#
# Usage:
#   scripts/regen-openapi.sh [--spec <path-or-url>]
#
# Requires java (any version >= 11 works with the 5.2.1 generator). Upstream runs
# the same generator through docker; the jar is used here so the script works
# without a container runtime.

set -euo pipefail

# Pinned to match upstream's Makefile. Newer majors emit a different client API
# (nullable getters, changed request builders) that the Terraform provider code
# does not compile against.
GENERATOR_VERSION="5.2.1"
GENERATOR_URL="https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${GENERATOR_VERSION}/openapi-generator-cli-${GENERATOR_VERSION}.jar"

# The module path the Terraform provider imports, and the Go version the
# generated go.mod should declare.
MODULE_PATH="contabo.com/openapi"
GO_VERSION="1.24"

SPEC="https://api.contabo.com/api-v1.yaml"

while [[ $# -gt 0 ]]; do
	case "$1" in
	--spec)
		SPEC="$2"
		shift 2
		;;
	*)
		echo "unknown argument: $1" >&2
		exit 1
		;;
	esac
done

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${REPO_ROOT}/provider/cntb/openapi"
CACHE="${REPO_ROOT}/.cache"
JAR="${CACHE}/openapi-generator-cli-${GENERATOR_VERSION}.jar"

WORK="$(mktemp -d)"
trap 'rm -rf "${WORK}"' EXIT

mkdir -p "${CACHE}"
if [[ ! -f "${JAR}" ]]; then
	echo "==> downloading openapi-generator ${GENERATOR_VERSION}"
	curl -fsSL -o "${JAR}" "${GENERATOR_URL}"
fi

echo "==> fetching spec from ${SPEC}"
if [[ "${SPEC}" == http*://* ]]; then
	curl -fsSL -o "${WORK}/api.yaml" "${SPEC}"
else
	cp "${SPEC}" "${WORK}/api.yaml"
fi

# The published spec tags a few operations with more than one tag. The Go
# generator emits one API service per tag and one request builder per operation,
# so a multi-tagged operation produces duplicate type declarations that do not
# compile. Keep only each operation's first tag.
echo "==> normalizing operation tags"
awk '
  # Track which top-level section we are in; only operations under "paths:" are rewritten.
  /^[^ #-]/ { in_paths = ($0 ~ /^paths:/); in_tags = 0 }
  in_tags && /^[ ]*-[ ]/ { if (seen) next; seen = 1; print; next }
  in_tags { in_tags = 0 }
  in_paths && /^[ ]+tags:[ ]*$/ { in_tags = 1; seen = 0 }
  { print }
' "${WORK}/api.yaml" >"${WORK}/api.normalized.yaml"

echo "==> generating client"
JAVA_OPTS='-Dio.swagger.parser.util.RemoteUrl.trustAll=true -Dio.swagger.v3.parser.util.RemoteUrl.trustAll=true' \
	java -jar "${JAR}" generate \
	--skip-validate-spec \
	--input-spec "${WORK}/api.normalized.yaml" \
	--generator-name go \
	--output "${WORK}/openapi" >"${WORK}/generate.log" 2>&1 ||
	{
		tail -40 "${WORK}/generate.log" >&2
		exit 1
	}

# The generator hardcodes a placeholder module path and an ancient Go directive.
cat >"${WORK}/openapi/go.mod" <<EOF
module ${MODULE_PATH}

go ${GO_VERSION}

require golang.org/x/oauth2 v0.30.0
EOF

echo "==> tidying generated module"
(cd "${WORK}/openapi" && go mod tidy >/dev/null && go build ./...)

echo "==> replacing ${DEST}"
rm -rf "${DEST}"
mkdir -p "$(dirname "${DEST}")"
mv "${WORK}/openapi" "${DEST}"

echo "==> done: $(find "${DEST}" -name '*.go' | wc -l | tr -d ' ') Go files"
