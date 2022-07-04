terraform {
  required_providers {
    aws = {
     version = "4.21.0"
      source = "hashicorp/aws"
    }

  }
}

variable "region" {
  type = string
  default = "eu-west-2"
}

variable "availability_zones" {
  type = string
  default = "eu-west-2a"
}

variable "AK" {
  type = string
 
}

variable "SK" {
  type = string

}



provider "aws" {
  region = var.region
  access_key = var.AK
  secret_key = var.SK

}
