# Examples

Each example depends on the SDK built from this repository, not on a published package.
Build the provider and SDKs first:

```bash
make provider build_nodejs
```

That produces `bin/pulumi-resource-contabo` and `sdk/nodejs/bin`, which the examples
reference through a relative `file:` dependency.

## Running an example

```bash
export PATH="$PWD/bin:$PATH"          # so Pulumi finds the locally built provider
export CNTB_OAUTH2_CLIENT_ID=...
export CNTB_OAUTH2_CLIENT_SECRET=...
export CNTB_OAUTH2_USER=...
export CNTB_OAUTH2_PASS=...

cd examples/ts-basic
npm install
pulumi stack init dev
pulumi up
```

Clean up with `pulumi destroy && pulumi stack rm dev`.

## ts-basic

Creates a Contabo tag and a secret, then reads the tag back through the `getTag` data
source. Both resource types are free, so this is a safe end-to-end check of the provider
against a real account. Resources that cost money — instances, object storage — are
deliberately not part of it.
