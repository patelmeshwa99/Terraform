provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "ami-id" {
  most_recent = true
  // Had it been our custom ami, we use self instead of amazon in owners list
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instanct-with-ami-from-datasource" {
  ami           = data.aws_ami.ami-id.id
  instance_type = "t2.micro"
}
