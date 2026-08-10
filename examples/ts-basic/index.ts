import * as contabo from "@lbialy/contabo";
import * as random from "@pulumi/random";

// Tags are free to create and exercise the full create/read/update/delete path.
const tag = new contabo.Tag("example", {
    color: "#0000ff",
});

// Secrets live in Contabo's secret store and are also free. `value` is marked secret
// in the Pulumi schema, so it is encrypted in state and masked in CLI output.
//
// Contabo's API rejects secret values containing `&` or `:` and reports the failure as
// "value must have at least 8 characters long", which is misleading. Verified by calling
// POST /v1/secrets directly: every other printable special character is accepted. Keep
// those two out of the generated password.
const rootPassword = new random.RandomPassword("root-password", {
    length: 24,
    special: true,
    overrideSpecial: "!@#$^*?_~",
});

const secret = new contabo.Secret("example-root-password", {
    type: "password",
    value: rootPassword.result,
});

// Data sources exercise the read path against the live API.
const tagLookup = contabo.getTagOutput({ id: tag.id });

export const tagId = tag.id;
export const tagName = tag.name;
export const tagColorRoundTrip = tagLookup.color;
export const secretId = secret.id;
export const secretName = secret.name;
export const secretType = secret.type;
