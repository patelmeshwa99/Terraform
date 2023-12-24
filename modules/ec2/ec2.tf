variable "ec2InstanceName" {
  type = string
}

resource "aws_instance" "my-ec2-instance-from-module" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2InstanceName
  }
}

output "ec2-instance-id" {
  value = aws_instance.my-ec2-instance-from-module.id
}
