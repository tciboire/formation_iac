# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

module "frontend" {

source="../Modules/vpc"

Region = "eu-west-1"
VPC_CIDR="10.1.0.0/16"
Subnet_CIDR=["10.1.1.0/24","10.1.10.0/24"]
Default_Route_CIDR="0.0.0.0/0"
VPC_TAGNAME="VPC_D2SI_2"
Subnet_TAGNAME ="Subnet_2" 
IG_TAGNAME = "IG_2" 
ROUTETABLE_TAGNAME = "ROUTETABLE_2"
}
