provider "aws" {
  region     = "us-east-1"
  profile    = "default"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags          = {
    Name = "terraform-example"
  }
}

resource "aws_iam_user" "iamuser" {
  name = "iamuser"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-12345678"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_eip.lb.public_ip]
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
  domain   = "vpc"
}
