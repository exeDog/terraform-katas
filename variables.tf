variable "vpn_ip" {
  description = "VPN IP"
  default     = "116.50.30.20/32"
  type        = string
}

variable "github_token" {
  description = "Github Token"
  default     = "ghp_1234567890"
  type        = string
}

variable "github_organization" {
  description = "Github Username"
  default     = "exedog"
  type        = string
}

variable "user_number" {
  description = "User Name"
  default     = "exedog"
  type        = number
}

variable "elb_name" {
  description = "ELB Name"
  default     = "exedog"
  type        = string
}

variable "availability_zones" {
  description = "ELB Zones"
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
  type        = list(string)
}

variable "elb_types" {
  type    = map(string)
  default = {
    "us-east-1"      = "t2.micro"
    "us-west-1"      = "t2.nano"
    "ap-northeast-1" = "t2.small"
  }
}

variable "is_test" {
  default     = false
  type        = bool
}
