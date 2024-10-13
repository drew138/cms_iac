resource "aws_route_table_association" "rt_association_public_az_1_1" {
  subnet_id      = aws_subnet.public_subnet_az_1_1.id
  route_table_id = aws_route_table.public_routing_table.id
}

resource "aws_route_table_association" "rt_association_public_az_2_2" {
  subnet_id      = aws_subnet.public_subnet_az_2_2.id
  route_table_id = aws_route_table.public_routing_table.id
}

resource "aws_route_table_association" "rt_association_private_az_1_1" {
  subnet_id      = aws_subnet.private_subnet_az_1_1.id
  route_table_id = aws_route_table.private_routing_table_az_1_1.id
}

resource "aws_route_table_association" "rt_association_private_az_2_2" {
  subnet_id      = aws_subnet.private_subnet_az_2_2.id
  route_table_id = aws_route_table.private_routing_table_az_2_2.id
}

resource "aws_route_table_association" "rt_association_private_az_1_3" {
  subnet_id      = aws_subnet.private_subnet_az_1_3.id
  route_table_id = aws_route_table.private_routing_table_az_1_3.id
}

resource "aws_route_table_association" "rt_association_private_az_2_4" {
  subnet_id      = aws_subnet.private_subnet_az_2_4.id
  route_table_id = aws_route_table.private_routing_table_az_2_4.id
}
