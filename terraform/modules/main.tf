module "ec2_instance" {
  source = "../terraform-ec2"

  sg_name        = "paymentop_test_sg"
  allowed_ports  = [22, 80]
  region = "us-east-1"
  ami_id         = ""
  volume_size    = 8
  volume_type    = "gp2"
  instance_name  = "example_instance"
  instance_type =  "t2.micro"
}