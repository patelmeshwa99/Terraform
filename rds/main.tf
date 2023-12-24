provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "myRDS" {
  db_name        = "myTestDb"
  identifier     = "unique-identifier"
  instance_class = "db.t2.micro"
  engine         = "mariadb"
  #   engine_version = "10.2.21"
  username = "hi"
  password = "hiagain123"
  #   port = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}
