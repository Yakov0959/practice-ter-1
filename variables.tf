
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-05a8c865b4de3b127"
}

variable "BN" {
  type    = string
  default = "hillel-18-yakov"
}

variable "EC2_name" {
  type    = string
  default = "my_ec2"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "availability_zones" {
  type    = string
  default = "eu-west-2a"
}

variable "AK" {
  type = string

}

variable "SK" {
  type = string

}




