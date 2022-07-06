
variable "instance_type" {
  type    = string
  default = "t2.micro"
  description = "Amazon EC2 Instance Types"
}

variable "ami" {
  type    = string
  default = "ami-05a8c865b4de3b127"
  description = "Amazon Machine Images"
}

variable "BN" {
  type    = string
  default = "hillel-18-yakov"
  description = "S3 backet name"
}

variable "EC2_name" {
  type    = string
  default = "my_ec2"
  description = "Amazon Elastic Compute Cloud name"
}

variable "region" {
  type    = string
  default = "eu-west-2"
  description = "Regions"
}

variable "availability_zones" {
  type    = string
  default = "eu-west-2a"
  description = "Availability Zones"
}

variable "AK" {
  type = string
description = "access key ID"
}

variable "SK" {
  type = string
description = "secret access key"
}




