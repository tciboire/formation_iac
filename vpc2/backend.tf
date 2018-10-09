terraform {
  backend "s3" {
    bucket = "mybitbucket99"
    key    = "vpc2/terraform.tfstate"
    region = "eu-west-1"
  }
}
