provider "aws" {
  region = "ap-southeast-1"
}

module "ec2-module" {
  source         = "./ec2"
  instance_names = ["mariadb", "mysql", "postgres"]
}

// Output the private ips of instances
output "private_ips" {
  value = module.ec2-module.private_ips
}
