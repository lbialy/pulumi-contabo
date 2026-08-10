# Contabo Resource Provider

The Contabo Resource Provider lets you manage [Contabo](https://contabo.com/en) resources.
It bridges [terraform-provider-contabo](https://github.com/contabo/terraform-provider-contabo)
**v0.1.44** with the [Pulumi Terraform Bridge](https://github.com/pulumi/pulumi-terraform-bridge).

## Resources

| Resource | Data source |
| --- | --- |
| `contabo.Firewall` | `contabo.getFirewall` |
| `contabo.Image` | `contabo.getImage` |
| `contabo.Instance` | `contabo.getInstance` |
| `contabo.InstanceSnapshot` | `contabo.getInstanceSnapshot` |
| `contabo.ObjectStorage` | `contabo.getObjectStorage` |
| `contabo.ObjectStorageBucket` | `contabo.getObjectStorageBucket` |
| `contabo.PrivateNetwork` | `contabo.getPrivateNetwork` |
| `contabo.Secret` | `contabo.getSecret` |
| `contabo.Tag` | `contabo.getTag` |
| `contabo.TagAssignment` | `contabo.getTagAssignment` |

## Installing

The provider binary is published to this repository's GitHub releases and resolved
automatically by Pulumi through the package's `pluginDownloadURL`.

### Node.js (JavaScript/TypeScript)

```bash
npm install @lbialy/contabo
```

### Python

```bash
pip install pulumi_contabo
```

### Go

```bash
go get github.com/lbialy/pulumi-contabo/sdk/go/...
```

### .NET

```bash
dotnet add package Lbialy.Contabo
```

## Configuration

Credentials come from the Customer Control Panel under
[Account Secret](https://new.contabo.com/account/security).

| Config key | Environment variable | Required |
| --- | --- | --- |
| `contabo:oauth2ClientId` | `CNTB_OAUTH2_CLIENT_ID` | yes |
| `contabo:oauth2ClientSecret` | `CNTB_OAUTH2_CLIENT_SECRET` | yes (secret) |
| `contabo:oauth2User` | `CNTB_OAUTH2_USER` | yes |
| `contabo:oauth2Pass` | `CNTB_OAUTH2_PASS` | yes (secret) |
| `contabo:api` | `CNTB_API` | no, defaults to `https://api.contabo.com` |
| `contabo:oauth2TokenUrl` | `CNTB_OAUTH2_TOKEN_URL` | no |

The legacy `CONTABO_*` spellings from v1 of this provider are still accepted as a
fallback for each of the above.

## Example

```typescript
import * as contabo from "@lbialy/contabo";

const tag = new contabo.Tag("web", { color: "#0000ff" });

const instance = new contabo.Instance("web", {
    productId: "V45",
    region: "EU",
    imageId: "afecbb85-e2fc-46f0-9684-b46b1faf00bb",
});
```

A runnable end-to-end example lives in [`examples/ts-basic`](examples/ts-basic).

## Developing

```bash
make provider       # build bin/pulumi-resource-contabo (runs tfgen first)
make build_sdks     # regenerate and build all four language SDKs
make test           # schema smoke test, no credentials needed
make test_e2e       # deploy examples/ts-basic against a real account
make lint_provider  # golangci-lint
```

### Upgrading the upstream Terraform provider

1. Bump the version in the `contabo.com/terraform-provider-contabo` replace directive in
   `provider/go.mod` and in `tfProviderVersion` in `provider/resources.go`.
2. Run `make openapi`. The upstream provider depends on a generated OpenAPI client that
   it git-ignores and never publishes, so this repository vendors one at
   `provider/cntb/openapi`. `scripts/regen-openapi.sh` regenerates it from
   <https://api.contabo.com/api-v1.yaml> using the same generator version upstream pins.
3. Run `cd provider && go mod tidy`, then `make build_sdks`, and map any new resources or
   data sources in `provider/resources.go`.

## Reference

Property-level documentation is generated from the upstream provider's docs and is
available in the generated SDKs.
