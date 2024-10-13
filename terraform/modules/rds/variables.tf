variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "private_subnet_az_1_3_id" {
  type        = string
  description = "private subnet 3 id for availability zone 1"
}

variable "private_subnet_az_2_4_id" {
  type        = string
  description = "private subnet 4 id for availability zone 2"
}

variable "public_subnet_cidr_az_1_1" {
  type        = string
  description = "public subnet 1 cidr for availability zone 1"
}

variable "private_subnet_cidr_az_1_1" {
  type        = string
  description = "private subnet 1 cidr for availability zone 1"
}
variable "private_subnet_cidr_az_2_2" {
  type        = string
  description = "private subnet 2 cidr for availability zone 2"
}
