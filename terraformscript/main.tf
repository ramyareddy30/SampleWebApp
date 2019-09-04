provider "aws { 
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
    }
resource 'aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        name = "${var.vpc_name}"
        }
}
resource "aws_internet_gatewat" "default" {
    vpc_id = "${aws_vpc.default.id}
    tags {
        name = "4{var.IGW_name}"
    }    
}
resource "aws_subnet" "subnet_public" {
    vpc_id = "${aws_vpc.dafault.id}"
    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "us_east_1a"
    tags {
        name = "${var.public_subnet_name}"
    }
}
resource "aws_subnet" "subnet_private" {
    vpc_id = "${aws?_vpc.default.id}"
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "us_east_1b"
    tags {
        name = "${var.private_subnet_name}"
    }
}
resource "aws_route_table" "terraform_public" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
    tags {
        name = "${aws_internet_gateway.dafault.id}"
    }
}
resource "aws_route_table_association" "terraform_public" {
    subnet_id = "${aws_subnet.subnet_public.id}"
    route_table_id = "${aws_route_table.terraform_public.id}"
}
resource "aws_securitygroup" "allow_all" {
    name + "allow_all"
    description = "allow all inbound traffic"
    vpc_id = "${aws_vpc.default.id}"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }    
    data "aws_subnet_ids" "private" {  
        vpc_id = "${aws_vpc.default.id}"
resource "aws_instance" "web-1" {
    ami = "${lookup(var.amis,var.aws_region)}"
    availability_zone = "us_east_1a"
    instance_type = "t2.micro"
    key_name = "${var.key.name}"
    subnet_id = "${aws_subnet.dubnet_public.id}"
    vpc_security_group_ids = "${aws_subnet.subnet_public.id}"
    associate_public_ip_address = true
    tags {
        name = "sever-${count.index}"
        env = "prod"
        owner = "ramya"
    }
}
}