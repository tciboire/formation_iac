# Configure the AWS Provider
provider "aws" {
  region = "${var.Region}"
}

resource "aws_vpc" "Myvpc" {
  cidr_block       = "${var.VPC_CIDR}"
  instance_tenancy = "default"

  tags {
    Name = "VPC_DS2SI"
  }
}

resource "aws_subnet" "MySubnet" {
  vpc_id            = "${aws_vpc.Myvpc.id}"
  cidr_block        = "${element(var.Subnet_CIDR, count.index)}"
  availability_zone = "${element(var.Azs, count.index)}"
  count             = 2

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
    cidr_block = "${var.Default_Route_CIDR}"
    gateway_id = "${aws_internet_gateway.Mygw.id}"
  }

  tags {
    Name = "Routetable D2SI"
  }
}

resource "aws_route_table_association" "Association_route" {
  subnet_id      = "${element(aws_subnet.MySubnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.Myroutetable.id}"
  count          = 2
}
