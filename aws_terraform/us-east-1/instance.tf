# Instance for Spark Demo
resource "aws_instance" "spark-jenkins-ec2-instance" {
    ami = "${lookup(var.ami, var.AWS_REGION)}"
    instance_type = "t2.micro"
    disable_api_termination = "true"
    subnet_id = "${aws_subnet.master-vpc-public-1.id}"
    vpc_security_group_ids = ["${aws_security_group.spark_demo_secutiry_group.id}"]
    key_name = "${aws_key_pair.spark-demo-key-pair.key_name}"
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = true
    }
    tags {
        Name = "Spark_Jenkins"
    }
    volume_tags {
        Name = "Spark_Jenkins"
    }
    provisioner "local-exec" {
	command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos -i '${self.public_ip},' --key-file ${var.PATH_TO_PRIVATE_KEY} --tags build_server ../../aws_ansible/playbook.yml"
    }
}

resource "aws_instance" "spark-application-ec2-instance" {
    ami = "${lookup(var.ami, var.AWS_REGION)}"
    instance_type = "t2.micro"
    disable_api_termination = "true"
    subnet_id = "${aws_subnet.master-vpc-public-1.id}"
    vpc_security_group_ids = ["${aws_security_group.spark_demo_secutiry_group.id}"]
    key_name = "${aws_key_pair.spark-demo-key-pair.key_name}"
    root_block_device {
    	volume_type           = "gp2"
    	volume_size           = 30
    	delete_on_termination = true
    }
    tags {
    	Name = "Spark_App_Server"
    }
    volume_tags {
    	Name = "Spark_App_Server"
    }
    provisioner "local-exec" {
	command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos -i '${self.public_ip},' --key-file ${var.PATH_TO_PRIVATE_KEY} --tags application_server ../../aws_ansible/playbook.yml"
    } 
}
