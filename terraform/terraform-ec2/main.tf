### SG ###

resource "aws_security_group" "ec2_sg" {
  name        = var.sg_name
  description = "Security group for EC2 instance"
  
  dynamic "ingress" {
    for_each = { for port in var.allowed_ports : port => port }
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example_security_group"
  }

}


### EC2 ###

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.paymentop_key_pair.key_name

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = var.instance_name
  }

  depends_on = [
    aws_security_group.ec2_sg,
    aws_key_pair.paymentop_key_pair
  ]
}


### AWS KEY PAIR ###

resource "aws_key_pair" "paymentop_key_pair" {
  key_name   = "paymentop-key-pair"
  public_key = file("~/.ssh/paymentop.pub") 
}

