provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "terraform_test" {
  cidr_block = "10.0.0.0/16"
  // cidr_block is a mandatory field
}