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
