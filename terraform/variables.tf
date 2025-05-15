variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (example)
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair" {
  description = "Name of your EC2 key pair"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "enable_elb" {
  type    = bool
  default = false
}
