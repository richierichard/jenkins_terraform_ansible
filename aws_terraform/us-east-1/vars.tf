variable "AWS_REGION"
{
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY"
{
  default = "spark-demo-key-pair"
}

variable "PATH_TO_PUBLIC_KEY"
{
  default = "spark-demo-key-pair.pub"
}

variable "ami"
{
  type = "map"
  default =
  {
    us-east-1 = "ami-9887c6e7"
  }
}
