# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "Myvpc" {
  cidr_block       = "172.23.0.0/16"
  instance_tenancy = "dedicated"

  tags {
    Name = "VPC_DS2SI"
  }
}

resource "aws_subnet" "MySubnet" {
  vpc_id     = "${aws_vpc.Myvpc.id}"
  cidr_block = "172.23.1.0/24"

  tags {
    Name = "Subnet_D2SI"
  }
}
