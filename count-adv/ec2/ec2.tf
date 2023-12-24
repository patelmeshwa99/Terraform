variable "instance_names" {
  type = list(string)
}

resource "aws_instance" "my-instances" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
  count         = length(var.instance_names)

  tags = {
    Name = var.instance_names[count.index]
  }
}

// Output private ips
output "private_ips" {
  value = aws_instance.my-instances.*.private_ip
}
