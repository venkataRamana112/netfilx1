provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0ddc798b3f1a5117e"
instance_type = "t2.medium"
key_name = "ramanapem"
vpc_security_group_ids = ["sg-05a41ab493052c23c"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "tomcat-1", "tomcat-2"]
}
