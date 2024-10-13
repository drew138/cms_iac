variable "aws_launch_template_ami_id" {
  type        = string
  default     = local.ami
  description = "AMI ID for the launch template"
}
