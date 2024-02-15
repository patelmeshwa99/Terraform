provider "aws" {
  region = "ap-southeast-1"
}

variable "isTest" {
  type    = bool
}

resource "aws_instance" "dev-instanct" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"

  tags = {
    Name = "dev"
  }
  count = var.isTest == true ? 1 : 0
}

resource "aws_instance" "prod-instanct" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"

  tags = {
    Name = "prod"
  }
  count = var.isTest == true ? 0 : 1
}