CHANGELOG
=========

## HEAD (Unreleased)

### Upgrades

- Upgrade the bridged Terraform provider from `contabo/terraform-provider-contabo`
  v0.1.17 to v0.1.44.
- Upgrade `pulumi-terraform-bridge` from v3.39.3 to v3.136.0 and the Pulumi SDK from
  v3.55.0 to v3.256.0.
- Regenerate the vendored Contabo OpenAPI client from the current API spec. The client is
  now reproducible via `make openapi` (`scripts/regen-openapi.sh`).

### Added

- New resources: `Firewall`, `Tag`, `TagAssignment`.
- New data sources: `getFirewall`, `getTag`, `getTagAssignment`.
- Resource and property documentation is now generated from the upstream provider's docs.
- A .NET SDK is now generated and committed alongside the Node.js, Python and Go SDKs.
- A runnable end-to-end example under `examples/ts-basic`.
- Missing credentials are now reported with an actionable error before the first API call.
- `oauth2ClientSecret`, `oauth2Pass` and `Secret.value` are marked secret, so they are
  encrypted in state and masked in CLI output.

### Breaking

- Resource tokens are now PascalCase and idiomatic for every language, e.g.
  `contabo:index/instance_snapshot:instance_snapshot` is now
  `contabo:index/instanceSnapshot:InstanceSnapshot`. Existing stacks must be re-imported
  or their state edited.
- Package identity moved out of Pulumi-owned namespaces: the Go module is
  `github.com/lbialy/pulumi-contabo`, the npm package is `@lbialy/contabo` and the NuGet
  package is `Lbialy.Contabo`.
- The upstream `CNTB_*` environment variables are now the primary source of credentials.
  The `CONTABO_*` names from v1 remain supported as a fallback.

---
