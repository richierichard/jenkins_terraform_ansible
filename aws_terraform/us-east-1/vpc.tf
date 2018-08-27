# Master VPC
resource "aws_vpc" "master-vpc" {
    cidr_block = "172.16.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "master-vpc"
    }
}

# Public Subnets
resource "aws_subnet" "master-vpc-public-1" {
    vpc_id = "${aws_vpc.master-vpc.id}"
    cidr_block = "172.16.0.0/24"
    map_public_ip_on_launch = "true"
    tags {
        Name = "master-vpc-public-1"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "master-vpc-internet-gateway" {
    vpc_id = "${aws_vpc.master-vpc.id}"
    tags {
	Name = "master-vpc-internet-gateway"
    }
}

# Route Tables
resource "aws_route_table" "master-vpc-public-route-table-1" {
    vpc_id = "${aws_vpc.master-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.master-vpc-internet-gateway.id}"
    }
    tags {
	Name = "master-vpc-public-route-table-1"
    }
}

# Route Table Associations
resource "aws_route_table_association" "master-vpc-route-table-association" {
    subnet_id = "${aws_subnet.master-vpc-public-1.id}"
    route_table_id = "${aws_route_table.master-vpc-public-route-table-1.id}"
}
