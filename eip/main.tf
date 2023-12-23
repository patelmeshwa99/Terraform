provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
}

resource "aws_eip" "my-elastic-ip" {
  instance = aws_instance.my-ec2-instance.id
}

output "EIP" {
  value = aws_eip.my-elastic-ip.public_ip
}
