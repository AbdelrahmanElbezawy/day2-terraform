# Default Security Group of VPC
resource "aws_security_group" "ITI_SG" {
  name        = "${var.vpc_name}-default-sg"
  description = "Default SG to ssh http traffics from the VPC"
  vpc_id      = aws_vpc.main.id
  depends_on = [
    aws_vpc.main
  ]

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.rt_cidr_block]
  }
  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.rt_cidr_block]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks      = [var.rt_cidr_block]
  }
  tags = {
    Name = var.SG_name
  }
}