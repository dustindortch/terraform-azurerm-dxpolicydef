variable policy_file {
  type        = string
  description = "File path for policy"
}

locals {
  policy_content = jsondecode(file(var.policy_file))
  policy_name    = split(".", basename(var.policy_file))
}