// Take server name
variable "server-name" {
  type = string
}

// Take security groups
variable "security-groups" {
  type = list(string)
}

// Server
resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
  tags = {
    Name = var.server-name
  }
  security_groups = var.security-groups
  user_data       = file("server-script.sh")
}

// Output/Export private ip
output "private-ip" {
  value = aws_instance.my-ec2-instance.private_ip
}

// Output/Export instance id
output "instance-id" {
  value = aws_instance.my-ec2-instance.id
}
