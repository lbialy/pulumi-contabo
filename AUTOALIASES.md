# Resource Aliases: v1 → v2 Token Migration

v2.0.0 renamed every resource token from snake_case to PascalCase. That is a breaking change
for anyone with a live v1 stack: Pulumi identifies resources in state by type token, so an
unaliased rename reads as "delete the old resource, create a new one".

**No aliases are declared today.** This document records why, and exactly what to do if someone
turns up who needs them. It exists so that decision does not have to be re-derived from scratch.

Everything below was verified against `pulumi-terraform-bridge v3.136.0` and the v1 schema at
commit `44aab49`.

---

## Why aliases were skipped

The v1 SDKs were never published anywhere:

| Artifact | v1 name | Status |
|---|---|---|
| npm | `@pulumi/contabo` | 404 — never published |
| PyPI | `pulumi-contabo` | 404 — never published |
| Go module proxy | `thedataflows/pulumi-contabo/sdk` | empty — never fetched |
| GitHub release | `v1.0.0` (Feb 2023) | one binary |

The Go proxy being empty is the strongest signal: it caches on first fetch, so an empty version
list means nobody ever ran `go get` against that module. The npm name was `@pulumi/contabo`, a
scope this fork never had permission to publish under, so that SDK was undistributable by
construction.

The entire reachable v1 surface is a single GitHub release binary. To be affected, someone would
have to have downloaded it and still be running a stack against it.

Aliases are permanent schema surface and cost every future contributor some reasoning, so they
were not worth adding speculatively. This is reversible — see below.

---

## The mapping

Taken from the committed schemas, not reconstructed by hand:
`git show 44aab49:provider/cmd/pulumi-resource-contabo/schema.json`.

### Resources that changed (7)

| Terraform type | v1 token | v2 token |
|---|---|---|
| `contabo_image` | `contabo:index/image:image` | `contabo:index/image:Image` |
| `contabo_instance` | `contabo:index/instance:instance` | `contabo:index/instance:Instance` |
| `contabo_instance_snapshot` | `contabo:index/instance_snapshot:instance_snapshot` | `contabo:index/instanceSnapshot:InstanceSnapshot` |
| `contabo_object_storage` | `contabo:index/object_storage:object_storage` | `contabo:index/objectStorage:ObjectStorage` |
| `contabo_object_storage_bucket` | `contabo:index/object_storage_bucket:object_storage_bucket` | `contabo:index/objectStorageBucket:ObjectStorageBucket` |
| `contabo_private_network` | `contabo:index/private_network:private_network` | `contabo:index/privateNetwork:PrivateNetwork` |
| `contabo_secret` | `contabo:index/secret:secret` | `contabo:index/secret:Secret` |

Note the two shapes. `image`, `instance` and `secret` are single words, so only the final type
name changed and the module segment stayed put. The compound names changed **both** segments —
`instance_snapshot` → `instanceSnapshot` in the module *and* `InstanceSnapshot` in the type. Get
both right or the alias will not match.

### Resources that need no alias (3)

`Firewall`, `Tag`, `TagAssignment` are new in v2. They have no v1 counterpart.

### Data sources: none needed (all 7)

v1 already used camelCase for data sources — `getImage`, `getInstance`, `getInstanceSnapshot`,
`getObjectStorage`, `getObjectStorageBucket`, `getPrivateNetwork`, `getSecret` — and all seven
tokens are byte-identical in v2. Functions are also stateless, so aliasing them would be
meaningless even if they had changed.

---

## Option A: the affected user fixes it themselves

**Try this first.** For one or two users it needs no provider release at all. Pulumi's
`aliases` resource option accepts an old type token directly in their program:

```ts
const snapshot = new contabo.InstanceSnapshot("snap", { /* ... */ }, {
    aliases: [{ type: "contabo:index/instance_snapshot:instance_snapshot" }],
});
```

```scala
contabo.InstanceSnapshot(
  "snap",
  contabo.InstanceSnapshotArgs(/* ... */),
  opts(aliases = List(Alias(`type` = "contabo:index/instance_snapshot:instance_snapshot")))
)
```

The alias can be dropped once `pulumi up` has run successfully and state carries the new token.

The blunter alternative is editing state directly with `pulumi state edit`, or exporting,
rewriting the `type` fields, and re-importing with `pulumi stack import`. Take a backup first
(`pulumi stack export > backup.json`).

---

## Option B: declare aliases in the provider

Worth it only if enough people are affected that fixing it once centrally beats telling each of
them to add a resource option.

`ResourceInfo.Aliases` is `[]tfbridge.AliasInfo`, and `AliasInfo` is an alias for `info.Alias`:

```go
type Alias struct {
    Type *string

    // Deprecated: name aliases are not supported and will be removed.
    Name *string
    // Deprecated: project aliases are not supported and will be removed.
    Project *string
}
```

Only `Type` is usable — do not reach for `Name` or `Project`. Use `tfbridge.Ref` to take the
pointer:

```go
Resources: map[string]*tfbridge.ResourceInfo{
    "contabo_instance_snapshot": {
        Tok: tfbridge.MakeResource(mainPkg, mainMod, "InstanceSnapshot"),
        Aliases: []tfbridge.AliasInfo{
            {Type: tfbridge.Ref("contabo:index/instance_snapshot:instance_snapshot")},
        },
    },
    "contabo_object_storage_bucket": {
        Tok: tfbridge.MakeResource(mainPkg, mainMod, "ObjectStorageBucket"),
        Aliases: []tfbridge.AliasInfo{
            {Type: tfbridge.Ref("contabo:index/object_storage_bucket:object_storage_bucket")},
        },
    },
    // ... the remaining five from the table above
},
```

Then `make build_sdks` and commit the regenerated SDKs — aliases are schema surface, so they
propagate into every language SDK and the drift check will demand them.

### Verifying

```bash
make tfgen
python3 -c "
import json; s=json.load(open('provider/cmd/pulumi-resource-contabo/schema.json'))
for t,r in sorted(s['resources'].items()):
    if r.get('aliases'): print(t, '->', [a.get('type') for a in r['aliases']])
"
```

Schema presence is necessary but not sufficient. A real test needs a stack created with the v1
plugin, then upgraded: `pulumi preview` must report **no changes**, not a replacement. Since v1
was never published, building that fixture means checking out `44aab49`, building the provider,
and standing up a stack against it — which is most of the reason this was not done pre-emptively.

Use free resources (`Tag`, `Secret`) for any such test. `Instance` and `ObjectStorage` bill a
full month per create and `destroy` only schedules cancellation — see the billing notes before
touching them.

---

## What about `MustApplyAutoAliases`?

It exists to generate aliases automatically across large renames, and it needs
`ProviderInfo.MetadataInfo` plus a committed `bridge-metadata.json` snapshotting the previous
token shape.

It is the wrong tool here:

- Seven renames are trivially enumerable by hand, and the table above already does it.
- The metadata file would have to describe a v1 that cannot be exercised, so it could not be
  validated.
- It was tried during the v2 work and removed. It adds a required file and a build step to
  produce something a literal map expresses more clearly.

Reach for it only if the provider later faces a rename large enough that hand-maintaining the
list becomes the bottleneck.

---

## What aliases do not fix

Aliases reconcile **type token identity** only. They do not help with:

- **Property renames or retypes.** If an input changed name or shape between versions, that is a
  separate migration and aliases are silent about it.
- **Go import paths.** v2 moved the SDK module to `github.com/lbialy/pulumi-contabo/sdk/v2`.
  Consumers must update imports; no provider-side setting changes that.
- **Physical resources.** Aliases only rewrite how Pulumi matches state to program. If a
  replacement has already happened, the old resource is already gone.
