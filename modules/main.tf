provider "aws" {
  region = "ap-southeast-1"
}

module "ec2-module" {
  source          = "./ec2"
  ec2InstanceName = "Name from module"
}

output "instance-id-from-module" {
  value = module.ec2-module.ec2-instance-id
}
