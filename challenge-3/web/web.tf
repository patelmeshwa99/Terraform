// Load module eip
module "eip-module" {
  source     = "./eip"
  instanceId = module.ec2-module.instance-id
}

// Load module sg
module "sg-module" {
  source       = "./sg"
  ingressrules = [80, 443]
}

// Load module ec2
module "ec2-module" {
  source          = "../ec2"
  server-name     = "my-web-server"
  security-groups = [module.sg-module.security-group-name]
}

// Output the elastic ip provided by eip-module
output "elastic-ip-of-web-server" {
  value = module.eip-module.elastic-ip
}
