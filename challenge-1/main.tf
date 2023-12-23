provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "challenge_1_vpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name: "TerraformVPC"
  }
}