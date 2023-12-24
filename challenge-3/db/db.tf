// Load module ec2
module "ec2-module" {
  source          = "../ec2"
  server-name     = "my-db-server"
  security-groups = []
}

// Output the private ip of DB instance
output "private-ip-of-db-server" {
  value = module.ec2-module.private-ip
}
