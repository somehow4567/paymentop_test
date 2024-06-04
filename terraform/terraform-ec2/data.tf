data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # "Canonical" owner id
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

