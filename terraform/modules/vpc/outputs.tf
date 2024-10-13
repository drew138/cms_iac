output "vpc_id" {
  value       = aws_vpc.cms_vpc.id
  description = "vpc id"
}

output "public_subnet_az_1_1_id" {
  value       = aws_subnet.public_subnet_az_1_1.id
  description = "public subnet 1 id availability zone 1"
}

output "public_subnet_az_2_2_id" {
  value       = aws_subnet.public_subnet_az_2_2.id
  description = "public subnet 2 id availability zone 2"
}

output "private_subnet_az_1_1_id" {
  value       = aws_subnet.private_subnet_az_1_1.id
  description = "private subnet 1 id availability zone 1"
}

output "private_subnet_az_2_2_id" {
  value       = aws_subnet.private_subnet_az_2_2.id
  description = "private subnet 2 id availability zone 2"
}

output "private_subnet_az_1_3_id" {
  value       = aws_subnet.private_subnet_az_1_3.id
  description = "private subnet 3 id availability zone 1"
}

output "private_subnet_az_2_4_id" {
  value       = aws_subnet.private_subnet_az_2_4.id
  description = "private subnet 4 id availability zone 2"
}
