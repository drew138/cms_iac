resource "aws_security_group" "sg_bastion_host" {
  name        = "sgBastionHost"
  description = "Allows SSH Access"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow SSH traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  revoke_rules_on_delete = true
}

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = var.instance_subnet_id
  vpc_security_group_ids = [aws_security_group.sg_bastion_host.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name = "i-BastionHost"
  }
}
