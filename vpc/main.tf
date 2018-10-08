# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
}

resource "aws_vpc" "Myvpc" {
  cidr_block       = "172.23.0.0/16"
  instance_tenancy = "dedicated"

  tags {
    Name = "VPC_DS2SI"
  }
}





