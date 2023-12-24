// Variable representing list of ports for ingress rule
variable "ingressrules" {
  type = list(number)
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

// Output the security group name
output "security-group-name" {
  value = aws_security_group.my-security-group-for-web-server.name
}
