output "rds_module_host" {
  value       = aws_db_instance.wordpress_db.endpoint
  description = "rds module host"
}
