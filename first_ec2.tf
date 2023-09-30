provider "aws" {
  region = "us-east-1"
  profile = "default"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "myec2" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-example"
    }
}
