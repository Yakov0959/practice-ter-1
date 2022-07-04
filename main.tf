
resource "aws_s3_bucket" "b" {
  bucket        = var.BN
 // region        = var.region
  force_destroy = true
}
  resource "aws_s3_bucket_ownership_controls" "b" {
  bucket = aws_s3_bucket.b.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

output "s3" {
  value = "${aws_s3_bucket.b.bucket_regional_domain_name}"
}


# Create a VPC
resource "aws_default_vpc" "my_vpc" {
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_default_subnet" "my_subnet" {
  availability_zone = var.availability_zones
}

# Create a Security Group for an EC2 instance
resource "aws_security_group" "instance" {
  vpc_id =  aws_default_vpc.my_vpc.id
  name = "http"

  ingress {
    from_port	  = 80
    to_port	    = 80
    protocol	  = "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }


 egress {
    from_port	  = 0
	  to_port		  = 0
	  protocol	  = "-1"
	  cidr_blocks	= ["0.0.0.0/0"]
  }

}


# Create an EC2 instance
resource "aws_instance" "my_ec2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id     =  aws_default_subnet.my_subnet.id
  associate_public_ip_address = true

  tags = {
        name = var.EC2_name
             }

  vpc_security_group_ids  = ["${aws_security_group.instance.id}"]
  key_name = "terraform_test"

  user_data = <<-EOF
	    #!/bin/bash
        sudo systemctl stop ufw
        sudo apt update
        sudo apt install -y nginx
        sudo systemctl start nginx
        systemctl enable nginx
	      EOF
}




output "public_ip" {
  value = "${aws_instance.my_ec2.public_ip}"
}
