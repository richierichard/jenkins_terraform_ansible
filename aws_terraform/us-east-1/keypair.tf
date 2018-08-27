resource "aws_key_pair" "spark-demo-key-pair" {
  key_name = "spark-demo-key-pair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
