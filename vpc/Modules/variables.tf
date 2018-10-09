variable "Region" {
  type = "string"
}
variable "VPC_NAME" { 
type = "string"
}

variable "VPC_CIDR" {
  type = "string"
}

variable "Subnet_CIDR" {
  type = "list"
}

variable "Default_Route_CIDR" {
  type = "string"
}

variable "Azs" {
  type    = "list"
  default = ["eu-west-1a", "eu-west-1b"]
}
