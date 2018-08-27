# Security Group for Spark Demo
resource "aws_security_group" "spark_demo_secutiry_group" {
    vpc_id = "${aws_vpc.master-vpc.id}"
    name = "spark_demo_secutiry_group"
    description = "Allow inbound traffic on 80 and 443 and restricted traffic on port 443"
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["122.178.243.36/32"]
    }
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
	Name = "spark_demo_secutiry_group"
    }
}
