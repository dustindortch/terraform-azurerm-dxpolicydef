# terraform-azurerm-dxpolicydef

Module to create Azure Policy definitions from JSON definition files.

The use case that this module resolves is taking existing policy definitions found in repositories, ARM templates, or examples pulled from Azure built-in policies and represent them via HCL in the existing format.

## Usage

```terraform
variable policy_directory {
  type    = string
  default = "./"
}

local {
  policy_files = fileset(var.policy_directory, "*.json")
}

module "policy" {
  source = "gihub.com/dustindortch/terraform-azurerm-dxpolicydef"

  for_each = toset(local.policy_files)

  policy_file = each.value
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_policy_definition.definition](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_file"></a> [policy\_file](#input\_policy\_file) | File path for policy | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The policy definition id |
<!-- END_TF_DOCS -->