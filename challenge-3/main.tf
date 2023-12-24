provider "aws" {
  region = "ap-southeast-1"
}

module "db-module" {
  source = "./db"
}

module "web-module" {
  source = "./web"
}

// Display the private ip of DB instance
output "db-server-private-ip" {
  value = module.db-module.private-ip-of-db-server
}

// Display the elastic ip of web server
output "web-server-elastic-ip" {
  value = module.web-module.elastic-ip-of-web-server
}
