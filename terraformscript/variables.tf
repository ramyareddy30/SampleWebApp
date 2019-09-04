variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
   description - "AMIs by region"
   default = {
    us_east_1 = "ami-058fa898e60a65408"
    us_east_2 = "ami-058fa898e60a65408"
   }
}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "main_routing_table" {}
variable "a2s" {
   description = "run the ec2 instances in these availability zones"
   type = "list"
   default = ["us_east-1a",us-east-1b"]
   }
variable "environment" {default = "dev"} 
variable "instance_type "{
    type = "map"
    default = {
        dev = "t2.nano"
        test = "t2.micro"
        prod = "t2.medium"
    }
}  
