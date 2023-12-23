provider "aws" {
  region = "ap-southeast-1"
}

// DB Server
resource "aws_instance" "my-ec2-instance-for-db" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
  tags = {
    Name = "my-db-server"
  }
}

// Output the private ip of DB instance
output "private-ip-of-db-server" {
  value = aws_instance.my-ec2-instance-for-db.private_ip
}

// Web server
resource "aws_instance" "my-ec2-instance-for-application" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
  tags = {
    Name = "my-web-server"
  }
  security_groups = [aws_security_group.my-security-group-for-web-server.name]
  user_data       = file("server-script.sh")
}

// Fix ip for web server
resource "aws_eip" "my-elastic-ip-for-web-server" {
  instance = aws_instance.my-ec2-instance-for-application.id
  tags = {
    Name = "my-elastic-ip-for-app-server"
  }
}

// Variable representing list of ports for ingress rule
variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_security_group" "my-security-group-for-web-server" {
  name = "Allow HTTPS"
  tags = {
    Name = "my-security-group-for-app-server"
  }

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      description      = "Allow inbound to all on http and https ports"
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
