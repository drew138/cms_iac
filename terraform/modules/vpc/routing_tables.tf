resource "aws_route_table" "public_routing_table" {
  vpc_id = aws_vpc.cms_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cms_igw.id
  }

  tags = {
    Name = "${var.vpc_name}-rtb-public"
  }
}

resource "aws_route_table" "private_routing_table_az_1_1" {
  vpc_id = aws_vpc.cms_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_az_1.id
  }

  tags = {
    Name = "${var.vpc_name}-rtb-public1${var.az_1}"
  }
}

resource "aws_route_table" "private_routing_table_az_2_2" {
  vpc_id = aws_vpc.cms_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_az_2.id
  }

  tags = {
    Name = "${var.vpc_name}-rtb-public2${var.az_2}"
  }
}

resource "aws_route_table" "private_routing_table_az_1_3" {
  vpc_id = aws_vpc.cms_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_az_1.id
  }

  tags = {
    Name = "${var.vpc_name}-rtb-public3${var.az_1}"
  }
}

resource "aws_route_table" "private_routing_table_az_2_4" {
  vpc_id = aws_vpc.cms_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_az_2.id
  }

  tags = {
    Name = "${var.vpc_name}-rtb-public4${var.az_2}"
  }
}
