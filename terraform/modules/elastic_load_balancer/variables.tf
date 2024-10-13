variable "subnet_ids" {
  type        = list(string)
  description = "private subnets 1 and 3 ids"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}
