terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "bucket_name"
    region = "eu-west-01"
    access_key = "access_key"
    secret_key = "secret_key"
  }
}