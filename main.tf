terraform {
  required_version = ">= 0.13.0"
}

resource "azurerm_policy_definition" "definition" {
  name         = local.policy_name
  policy_type  = local.policy_content.properties.policyType
  mode         = local.policy_content.properties.mode
  display_name = local.policy_content.properties.displayName

  metadata    = jsonencode(local.policy_content.properties.metadata)
  policy_rule = jsonencode(local.policy_content.properties.policyRule)
  parameters  = jsonencode(local.policy_content.properties.parameters)
}