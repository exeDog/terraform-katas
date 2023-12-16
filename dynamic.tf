resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow inbound traffic"

  dynamic "ingress" {
    for_each = var.sg_group
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0/0"]
    }
  }

    dynamic "egress" {
        for_each = var.sg_group_egress
        iterator = port
        content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0/0"]
        }
    }
}

variable "sg_group" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 80, 443]
}

variable "sg_group_egress" {
  type        = list(number)
  description = "List of egress ports"
  default     = [0, 80, 443]
}
