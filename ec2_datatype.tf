resource "aws_iam_user" "lb" {
  name = var.user_number
  path = "/system/"
}

resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.availability_zones

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    interval            = 30
    target              = "HTTP:8000/health"
    timeout             = 3
    unhealthy_threshold = 2
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
}

resource "aws_instance" "myec2" {
  ami           = "foo"
  instance_type = var.elb_types["us-east-1"]
  count = var.is_test ? 1 : 2
}

data "aws_ami" "myami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["myami"]
  }
}

data "terraform_remote_state" "my-remote-state" {
  backend = "s3"
  config = {
    bucket = "mybucket"
    key = "path/to/my/key"
    region = "us-east-1"
  }
}
