provider "aws" {
  region = "ap-southeast-1"
}

variable "number_of_instances" {
  type = number
}

resource "aws_instance" "my-instance" {
  ami           = "ami-0e4b5d31e60aa0acd"
  instance_type = "t2.micro"
  count         = var.number_of_instances
  tags = {
    Name = "First instance"
  }
}

data "aws_instance" "myDataSource" {
  instance_id = "i-0e86dc5b04aeaca4f"
  filter {
    name   = "tag:Name"
    values = ["First instance"]
  }

  filter {
    name   = "image-id"
    values = ["ami-0e4b5d31e60aa0acd"]
  }
}

output "filteredInstances" {
  value = data.aws_instance.myDataSource.arn
}
