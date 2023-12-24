variable "instanceId" {
  type = string
}

// Fix ip for web server
resource "aws_eip" "my-elastic-ip-for-web-server" {
  instance = var.instanceId
  tags = {
    Name = "my-elastic-ip-for-app-server"
  }
}

// Output the elastic ip value
output "elastic-ip" {
  value = aws_eip.my-elastic-ip-for-web-server.public_ip
}
