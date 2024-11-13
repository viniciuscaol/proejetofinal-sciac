variable "region" {
  default = "us-east-1"
  type    = string
}

variable "vpc-cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "availability_zone" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type    = list(string)
}

variable "ec2_ami" {
  default = "ami-06b21ccaeff8cd686"
  type    = string
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}