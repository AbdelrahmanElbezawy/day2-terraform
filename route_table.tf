#public_route_table
#route-table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = var.pub_rt_name
  }
}
#table-association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet[0].id
  route_table_id = aws_route_table.public.id
}

############
#private_route_table
#route-table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.priv_rt_name
  }
}

# Route for NAT
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.rt_cidr_block
  nat_gateway_id         = aws_nat_gateway.nat.id
}

#table-association
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.subnet[1].id
  route_table_id = aws_route_table.private.id
}
############