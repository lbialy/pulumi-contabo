PROJECT_NAME := contabo Package

SHELL            := /bin/bash
PACK             := contabo
ORG              := lbialy
PROJECT          := github.com/${ORG}/pulumi-${PACK}
NODE_MODULE_NAME := @${ORG}/${PACK}
TF_NAME          := ${PACK}
PROVIDER_PATH    := provider
VERSION_PATH     := ${PROVIDER_PATH}/pkg/version.Version

TFGEN           := pulumi-tfgen-${PACK}
PROVIDER        := pulumi-resource-${PACK}
VERSION         := $(shell pulumictl get version)

TESTPARALLELISM := 4

WORKING_DIR     := $(shell pwd)

.PHONY: development build only_build provider tfgen openapi \
	build_sdks build_nodejs build_python build_go build_dotnet \
	install_sdks install_dotnet_sdk install_python_sdk install_go_sdk install_nodejs_sdk \
	lint_provider test test_provider test_e2e clean cleanup help

development:: install_plugins provider lint_provider build_sdks install_sdks cleanup # Build the provider & SDKs for a development environment

# Required for the codegen action that runs in pulumi/pulumi and pulumi/pulumi-terraform-bridge
build:: install_plugins provider build_sdks install_sdks
only_build:: build

# Location of the upstream Terraform provider sources in the module cache. tfgen reads
# the markdown under its docs/ directory to populate resource descriptions and examples.
# The bridge cannot infer this itself because the module is consumed through a replace
# directive under a different module path (contabo.com/terraform-provider-contabo).
UPSTREAM_REPO_PATH = $(shell cd provider && go list -m -f '{{.Dir}}' contabo.com/terraform-provider-contabo)

tfgen:: install_plugins
	(cd provider && go build -o $(WORKING_DIR)/bin/${TFGEN} -ldflags "-X ${PROJECT}/${VERSION_PATH}=${VERSION}" ${PROJECT}/${PROVIDER_PATH}/cmd/${TFGEN})
	PULUMI_CONTABO_UPSTREAM_REPO_PATH="$(UPSTREAM_REPO_PATH)" $(WORKING_DIR)/bin/${TFGEN} schema --out provider/cmd/${PROVIDER}
	(cd provider && VERSION=$(VERSION) go generate cmd/${PROVIDER}/main.go)

provider:: tfgen install_plugins # build the provider binary
	(cd provider && go build -o $(WORKING_DIR)/bin/${PROVIDER} -ldflags "-X ${PROJECT}/${VERSION_PATH}=${VERSION}" ${PROJECT}/${PROVIDER_PATH}/cmd/${PROVIDER})

openapi:: # regenerate the vendored Contabo OpenAPI client from the live API spec
	./scripts/regen-openapi.sh

build_sdks:: install_plugins provider build_nodejs build_python build_go build_dotnet # build all the sdks

build_nodejs:: VERSION := $(shell pulumictl get version --language javascript)
build_nodejs:: install_plugins tfgen # build the node sdk
	$(WORKING_DIR)/bin/$(TFGEN) nodejs --out sdk/nodejs/
	cd sdk/nodejs/ && \
		yarn install && \
		yarn run tsc && \
		cp ../../README.md ../../LICENSE package.json ./bin/ && \
		sed -i.bak -e "s/\$${VERSION}/$(VERSION)/g" ./bin/package.json && \
		rm ./bin/package.json.bak

build_python:: PYPI_VERSION := $(shell pulumictl get version --language python)
build_python:: install_plugins tfgen # build the python sdk
	$(WORKING_DIR)/bin/$(TFGEN) python --out sdk/python/
	cd sdk/python/ && \
		cp ../../README.md . && \
		rm -rf ./bin/ ../python.bin/ && cp -R . ../python.bin && mv ../python.bin ./bin && \
		sed -i.bak -e 's/^VERSION = .*/VERSION = "$(PYPI_VERSION)"/g' -e 's/^PLUGIN_VERSION = .*/PLUGIN_VERSION = "$(VERSION)"/g' ./bin/setup.py && \
		rm ./bin/setup.py.bak && \
		cd ./bin && python3 -m build --sdist .

build_dotnet:: DOTNET_VERSION := $(shell pulumictl get version --language dotnet)
build_dotnet:: install_plugins tfgen # build the dotnet sdk
	$(WORKING_DIR)/bin/$(TFGEN) dotnet --out sdk/dotnet/
	cd sdk/dotnet/ && \
		echo "${DOTNET_VERSION}" >version.txt && \
		dotnet build /p:Version=${DOTNET_VERSION}

build_go:: install_plugins tfgen # build the go sdk
	$(WORKING_DIR)/bin/$(TFGEN) go --out sdk/go/
	cd sdk && go build ./...

lint_provider:: provider # lint the provider code
	cd provider && golangci-lint run -c ../.golangci.yml

cleanup:: # cleans up the temporary directory
	rm -rf $(WORKING_DIR)/bin
	rm -f provider/cmd/${PROVIDER}/schema.go

help::
	@grep '^[^.#]\+:\s\+.*#' Makefile | \
	sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "\033[93m"`\1`printf "\033[0m"`	\3 [\2]/" | \
	expand -t20

clean::
	rm -rf sdk/{dotnet,nodejs,go,python}

install_plugins::
	[ -x $(shell which pulumi) ] || curl -fsSL https://get.pulumi.com | sh

install_dotnet_sdk::
	mkdir -p $(WORKING_DIR)/nuget
	find . -name '*.nupkg' -print -exec cp -p {} ${WORKING_DIR}/nuget \;

install_python_sdk::

install_go_sdk::

install_nodejs_sdk::
	yarn link --cwd $(WORKING_DIR)/sdk/nodejs/bin

install_sdks:: install_dotnet_sdk install_python_sdk install_nodejs_sdk

test_provider:: provider # verify the provider binary serves its schema (no credentials needed)
	pulumi package get-schema $(WORKING_DIR)/bin/${PROVIDER} > /dev/null
	@echo "provider schema OK"

test:: test_provider # run the checks that do not need Contabo credentials
	cd provider && go test ./... -count=1

# End-to-end check against a real Contabo account. Requires CNTB_OAUTH2_* to be exported.
# See examples/README.md.
test_e2e:: provider build_nodejs
	cd examples/ts-basic && npm install && \
		PATH="$(WORKING_DIR)/bin:$$PATH" pulumi up --stack e2e --yes && \
		PATH="$(WORKING_DIR)/bin:$$PATH" pulumi destroy --stack e2e --yes
