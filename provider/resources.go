// Copyright 2016-2018, Pulumi Corporation.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package contabo

import (
	"fmt"
	"os"
	"path/filepath"

	"contabo.com/terraform-provider-contabo/contabo"
	"github.com/pulumi/pulumi-terraform-bridge/v3/pkg/tfbridge"
	shim "github.com/pulumi/pulumi-terraform-bridge/v3/pkg/tfshim"
	shimv2 "github.com/pulumi/pulumi-terraform-bridge/v3/pkg/tfshim/sdk-v2"
	"github.com/pulumi/pulumi/sdk/v3/go/common/resource"

	"github.com/lbialy/pulumi-contabo/provider/pkg/version"
)

const (
	// mainPkg controls the default name of the package in the nodejs and python
	// package registries.
	mainPkg = "contabo"
	// mainMod is the only module this provider exposes.
	mainMod = "index"

	// tfProviderVersion is the version of github.com/contabo/terraform-provider-contabo
	// this provider bridges. Keep in sync with the replace directive in go.mod.
	tfProviderVersion = "0.1.44"

	// upstreamRepoPathEnvVar points tfgen at a checkout of the upstream Terraform
	// provider so it can pick up the markdown documentation under docs/. The bridge
	// normally infers this from the Go module cache, but it cannot here: the upstream
	// module declares itself as contabo.com/terraform-provider-contabo, so it is
	// consumed through a replace directive and is not resolvable under its GitHub
	// path. The Makefile sets this from `go list -m`.
	upstreamRepoPathEnvVar = "PULUMI_CONTABO_UPSTREAM_REPO_PATH"
)

// oauth2Credentials lists the provider config keys that must be set for the upstream
// provider to obtain a token, along with the environment variables that supply them.
var oauth2Credentials = []struct {
	pulumiKey string
	envVars   []string
}{
	{"oauth2ClientId", []string{"CNTB_OAUTH2_CLIENT_ID", "CONTABO_OAUTH2_CLIENT_ID"}},
	{"oauth2ClientSecret", []string{"CNTB_OAUTH2_CLIENT_SECRET", "CONTABO_OAUTH2_CLIENT_SECRET"}},
	{"oauth2User", []string{"CNTB_OAUTH2_USER", "CONTABO_OAUTH2_USER"}},
	{"oauth2Pass", []string{"CNTB_OAUTH2_PASS", "CONTABO_OAUTH2_PASS"}},
}

// preConfigureCallback reports missing credentials up front. Without it the upstream
// provider fails during configuration with "error in getting access token", which gives
// no hint about which value is missing.
func preConfigureCallback(vars resource.PropertyMap, _ shim.ResourceConfig) error {
	var missing []string
	for _, cred := range oauth2Credentials {
		if v, ok := vars[resource.PropertyKey(cred.pulumiKey)]; ok && v.IsString() && v.StringValue() != "" {
			continue
		}
		if anyEnvVarSet(cred.envVars) {
			continue
		}
		missing = append(missing, fmt.Sprintf("%s:%s (or $%s)", mainPkg, cred.pulumiKey, cred.envVars[0]))
	}
	if len(missing) > 0 {
		return fmt.Errorf("missing Contabo API credentials: %v.\n"+
			"Find them in the Customer Control Panel under Account Secret: "+
			"https://new.contabo.com/account/security", missing)
	}
	return nil
}

func anyEnvVarSet(names []string) bool {
	for _, name := range names {
		if os.Getenv(name) != "" {
			return true
		}
	}
	return false
}

// envDefault builds a config default that reads the upstream CNTB_ variable first and
// falls back to the CONTABO_ variable this provider has accepted since v1.
func envDefault(suffix string) *tfbridge.DefaultInfo {
	return &tfbridge.DefaultInfo{
		EnvVars: []string{"CNTB_" + suffix, "CONTABO_" + suffix},
	}
}

// Provider returns additional overlaid schema and metadata associated with the provider.
func Provider() tfbridge.ProviderInfo {
	secret := true
	mitLicense := tfbridge.MITLicenseType

	prov := tfbridge.ProviderInfo{
		P:                 shimv2.NewProvider(contabo.Provider()),
		Name:              mainPkg,
		DisplayName:       "Contabo",
		Publisher:         "lbialy",
		Version:           version.Version,
		Description:       "A Pulumi package for creating and managing Contabo cloud resources",
		Keywords:          []string{"pulumi", "contabo", "category/cloud"},
		License:           "Apache-2.0",
		Homepage:          "https://github.com/lbialy/pulumi-contabo",
		Repository:        "https://github.com/lbialy/pulumi-contabo",
		PluginDownloadURL: "github://api.github.com/lbialy/pulumi-contabo",

		// The GitHub org of the *upstream Terraform provider*, used to locate its docs.
		GitHubOrg:         "contabo",
		TFProviderVersion: tfProviderVersion,
		TFProviderLicense: &mitLicense,
		UpstreamRepoPath:  os.Getenv(upstreamRepoPathEnvVar),

		Config: map[string]*tfbridge.SchemaInfo{
			"api":              {Default: envDefault("API")},
			"oauth2_token_url": {Default: envDefault("OAUTH2_TOKEN_URL")},
			"oauth2_client_id": {Default: envDefault("OAUTH2_CLIENT_ID")},
			"oauth2_user":      {Default: envDefault("OAUTH2_USER")},
			// The upstream schema does not mark these Sensitive, so do it here to keep
			// them out of plaintext state and CLI output.
			"oauth2_client_secret": {Default: envDefault("OAUTH2_CLIENT_SECRET"), Secret: &secret},
			"oauth2_pass":          {Default: envDefault("OAUTH2_PASS"), Secret: &secret},
		},
		PreConfigureCallback: preConfigureCallback,

		Resources: map[string]*tfbridge.ResourceInfo{
			"contabo_firewall":              {Tok: tfbridge.MakeResource(mainPkg, mainMod, "Firewall")},
			"contabo_image":                 {Tok: tfbridge.MakeResource(mainPkg, mainMod, "Image")},
			"contabo_instance":              {Tok: tfbridge.MakeResource(mainPkg, mainMod, "Instance")},
			"contabo_instance_snapshot":     {Tok: tfbridge.MakeResource(mainPkg, mainMod, "InstanceSnapshot")},
			"contabo_object_storage":        {Tok: tfbridge.MakeResource(mainPkg, mainMod, "ObjectStorage")},
			"contabo_object_storage_bucket": {Tok: tfbridge.MakeResource(mainPkg, mainMod, "ObjectStorageBucket")},
			"contabo_private_network":       {Tok: tfbridge.MakeResource(mainPkg, mainMod, "PrivateNetwork")},
			"contabo_secret": {
				Tok: tfbridge.MakeResource(mainPkg, mainMod, "Secret"),
				Fields: map[string]*tfbridge.SchemaInfo{
					"value": {Secret: &secret},
				},
			},
			"contabo_tag":            {Tok: tfbridge.MakeResource(mainPkg, mainMod, "Tag")},
			"contabo_tag_assignment": {Tok: tfbridge.MakeResource(mainPkg, mainMod, "TagAssignment")},
		},

		DataSources: map[string]*tfbridge.DataSourceInfo{
			"contabo_firewall":              {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getFirewall")},
			"contabo_image":                 {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getImage")},
			"contabo_instance":              {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getInstance")},
			"contabo_instance_snapshot":     {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getInstanceSnapshot")},
			"contabo_object_storage":        {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getObjectStorage")},
			"contabo_object_storage_bucket": {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getObjectStorageBucket")},
			"contabo_private_network":       {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getPrivateNetwork")},
			"contabo_secret": {
				Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getSecret"),
				Fields: map[string]*tfbridge.SchemaInfo{
					"value": {Secret: &secret},
				},
			},
			"contabo_tag":            {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getTag")},
			"contabo_tag_assignment": {Tok: tfbridge.MakeDataSource(mainPkg, mainMod, "getTagAssignment")},
		},

		JavaScript: &tfbridge.JavaScriptInfo{
			PackageName: "@lbialy/contabo",
			Dependencies: map[string]string{
				"@pulumi/pulumi": "^3.0.0",
			},
			DevDependencies: map[string]string{
				"@types/node": "^18.0.0",
			},
		},
		Python: &tfbridge.PythonInfo{
			PackageName: "pulumi_contabo",
			Requires: map[string]string{
				"pulumi": ">=3.0.0,<4.0.0",
			},
		},
		Golang: &tfbridge.GolangInfo{
			ImportBasePath: filepath.Join(
				fmt.Sprintf("github.com/lbialy/pulumi-%[1]s/sdk/", mainPkg),
				tfbridge.GetModuleMajorVersion(version.Version),
				"go",
				mainPkg,
			),
			GenerateResourceContainerTypes: true,
		},
		CSharp: &tfbridge.CSharpInfo{
			RootNamespace: "Lbialy",
			PackageReferences: map[string]string{
				"Pulumi": "3.*",
			},
		},
	}

	prov.SetAutonaming(255, "-")

	return prov
}
