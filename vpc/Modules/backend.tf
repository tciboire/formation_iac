terraform {
  backend "s3" {
    bucket = "mybitbucket99"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}
