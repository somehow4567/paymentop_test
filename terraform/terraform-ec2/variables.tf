variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "Type of the EBS volume"
  type        = string
  default     = "gp2"
}

variable "ami_id" {
  description = "AMI ID to use for the instance. If not provided, the latest Ubuntu AMI will be used"
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "paymentop_test"
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "paymentop_test_sg"
}

variable "allowed_ports" {
  type    = list(number)
  default = [22, 80]
}