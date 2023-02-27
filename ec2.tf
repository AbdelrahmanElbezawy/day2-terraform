#create-EC2
module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  count                  = "${length(var.ec2_name)}"
  name                   = var.ec2_name[count.index]
  ami                    = var.ami_id
  key_name               = var.key_name
  instance_type          = var.instance_type
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.ITI_SG.id]
  subnet_id              = aws_subnet.subnet[count.index].id
  
user_data = <<EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y httpd
  sudo systemctl start httpd.service
  sudo systemctl enable httpd.service
  sudo chmod -R 755 /var/www
  sudo echo "<h1>Hello world from $(hostname -f)</h1>" > /var/www/html/index.html

EOF
}
##############