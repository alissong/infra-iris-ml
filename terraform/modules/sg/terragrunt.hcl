#include {
#  path = find_in_parent_folders()
#}

terraform {
  source = "${get_repo_root()}/modules/sg"
}

include {
  path = find_in_parent_folders("terraform/terragrunt.hcl")
}
