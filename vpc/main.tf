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

resource "aws_internet_gateway" "Mygw" {
  vpc_id = "${aws_vpc.Myvpc.id}"

  tags {
    Name = "IG_D2SI"
  }
}

resource "aws_route_table" "Myroutetable" {
  vpc_id = "${aws_vpc.Myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.Mygw.id}"
  }

  tags {
    Name = "Routetable D2SI"
  }
}
