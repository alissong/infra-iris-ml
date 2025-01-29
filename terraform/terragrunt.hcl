terraform {
  source = "./modules//${path_relative_to_include()}"

  extra_arguments "custom_vars" { 
    commands = ["apply", "console", "destroy", "import", "plan", "push", "refresh"] 
    arguments = [ 
      "-var-file=${get_terragrunt_dir()}/variables.tfvars"
    ] 
  } 
}

inputs = {
  vpc_id               = "vpc-06d92fe8a8a2338f0"
  ecs_cluster_name     = "ml-cluster"
  subnets = [
    "subnet-0522f692a71b93afa",
    "subnet-05f058473e31031e2",
    "subnet-0e6fcadc1e484717b",
    "subnet-01a3b68c5b08053e0",
    "subnet-099e91ac697f2c4f7",
    "subnet-06d4b5cee3e9e8977"
  ]
}
