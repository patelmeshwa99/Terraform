provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "my-ec2-instance" {
  ami             = "ami-0e4b5d31e60aa0acd"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.my-security-group.name]
}

// Variable representing list of ports for ingress rule
variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

// Variable representing list of ports for egress rule
variable "egressrules" {
  type    = list(number)
  default = [80, 443, 3600]
}

resource "aws_security_group" "my-security-group" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      description      = "Allow HTTPS inbound to all"
      from_port        = port.value
      to_port          = port.value
      protocol         = "TCP"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      description      = "All protocols from all ports to all"
      from_port        = port.value
      to_port          = port.value
      protocol         = "TCP"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  }
}
