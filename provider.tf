terraform {
  required_providers {
    aws = {
     version = "4.21.0"
      source = "hashicorp/aws"
    }

  }
}
provider "aws" {
  region = var.region
  access_key = var.AK
  secret_key = var.SK

}





