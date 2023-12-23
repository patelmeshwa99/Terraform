provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "my-ec2-instance" {
  ami             = "ami-0e4b5d31e60aa0acd"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.my-security-group.name]
}

resource "aws_security_group" "my-security-group" {
  name = "Allow HTTPS"
  ingress = [
    {
      description      = "Allow HTTPS inbound to all"
      from_port        = 443
      to_port          = 443
      protocol         = "TCP"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress = [
    {
      description      = "All protocols from all ports to all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}
