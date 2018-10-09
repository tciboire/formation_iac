output "vpc_id" {
  value = "${aws_vpc.Myvpc.id}"
}

output "subnet_id" {
  value = "${aws_subnet.MySubnet.id}"
}
