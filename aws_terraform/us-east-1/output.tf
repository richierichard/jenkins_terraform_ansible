output "spark-application-private-ip"
{
  value = "${aws_instance.spark-application-ec2-instance.private_ip}"
}

output "spark-application-public-ip"
{
  value = "${aws_instance.spark-application-ec2-instance.public_ip}"
}

#output "spark-application-public-ip"
#{
#  value = "${aws_eip.spark-application-eip.public_ip}"
#}

output "spark-jenkins-private-ip"
{
  value = "${aws_instance.spark-jenkins-ec2-instance.private_ip}"
}

output "spark-jenkins-public-ip"
{
  value = "${aws_instance.spark-jenkins-ec2-instance.public_ip}"
}

#output "spark-jenkins-public-ip"
#{
#  value = "${aws_eip.spark-jenkins-eip.public_ip}"
#}
