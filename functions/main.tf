provider "aws" {
  region = var.final-region
}

locals {
  // Timestamp function
  // Formatdate function to format date in any specific form
  time = formatdate("DD MM YYYY", timestamp())
}

variable "final-region" {
  type    = string
  default = "ap-southeast-1"
}

variable "ami-per-region" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-0e4b5d31e60aa0acd"
  }
}

variable "tags" {
  type    = list(string)
  default = ["instance-1", "instance-2"]

}

// Lookup function
resource "aws_instance" "lookupFunction" {
  // params: map, key to search, default value (if nothing found)
  ami   = lookup(var.ami-per-region, var.final-region, "ami-0e4b5d31e60aa0acd")
  count = 2

  // Element function
  // Params: list & index
  tags = {
    Name = element(var.tags, count.index)
  }

  // File function
  // Finds the file mentioned and reads the content and returns it as string
  // Note, path should be relative
  instance_type = file("dummy-data.txt")
}

output "executionTime" {
  value = local.time
}
