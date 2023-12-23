provider "aws" {
  region = "eu-west-1"
}

variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  type    = bool
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["value1", "value2"]
}

variable "mymap" {
  type = map(any)
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of VPC"
}

resource "aws_vpc" "terraform_test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name : var.inputname
  }
}

output "vpcid" {
  value = aws_vpc.terraform_test.id
}

variable "mytuple" {
  type    = ([string, number, string])
  default = ["Value1", 12, "Value2"]
}

variable "myObject" {
  type = object({
    name = string
    port = list(number)
  })
  default = {
    name = "Value1"
    port = [12, 13, 14]
  }
}
