provider "aws" {
  region = "ap-southeast-1"
}

// DB server to be spun up first before web server
resource "aws_instance" "db-instance" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
}

// Web server depending on db server to get up first
resource "aws_instance" "web-instance" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"

  // This decides the number of instances to be spun up
  count = 3
  depends_on = [aws_instance.db-instance]
}
