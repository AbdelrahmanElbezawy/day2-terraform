#subnet
resource "aws_subnet" "subnet" {
  count                   = "${length(var.subnet_cidr)}"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.subnet_cidr[count.index]}"
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch[count.index]
  tags = {
    Name = var.subnet_name[count.index]
  }
}
############
#elastic_ip
resource "aws_eip" "eip" {
  #vpc        = true
  depends_on = [aws_internet_gateway.main]
  tags = {
    Name = var.eip_name
  }
}
############
#nat_gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = element(aws_subnet.subnet.*.id, 0)

  tags = {
    Name = var.nat_gateway
  }
  depends_on = [aws_internet_gateway.main]
}