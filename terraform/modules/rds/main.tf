resource "aws_security_group" "sg_db_cms" {
  name        = "sgDB-CMS"
  description = "Allows SQL Access"
  vpc_id      = var.vpc_id

  # MySQL/Aurora rule for 172.16.2.0/24
  ingress {
    description      = "Allow connections to the DB from private subnet ${var.private_subnet_cidr_az_1_1}"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [var.private_subnet_cidr_az_1_1]
  }

  # MySQL/Aurora rule for 172.16.5.0/24
  ingress {
    description      = "Allow connections to the DB from private subnet ${var.private_subnet_cidr_az_2_2}"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [var.private_subnet_cidr_az_2_2]
  }

  # SSH rule for 172.16.1.0/24
  ingress {
    description      = "Allow SSH traffic from ${var.public_subnet_cidr_az_1_1}"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.public_subnet_cidr_az_1_1]
  }

  revoke_rules_on_delete = true
}

resource "aws_db_subnet_group" "mariadb_subnet_group" {
  name       = local.db_subnet_group_name
  description = "Subnet group for RDS"
  subnet_ids = [
    var.private_subnet_az_1_3_id,
    var.private_subnet_az_2_4_id,
  ]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "wordpress_db" {
  engine               = "mariadb"
  db_name              = "wordpress"
  username             = "wpuser"
  password             = "wppassword"
  instance_class       = "db.t3.micro"
  storage_type         = "gp2"
  allocated_storage    = 20
  engine_version       = "10.11.8"
  skip_final_snapshot  = true
  publicly_accessible = false
  multi_az = true

  db_subnet_group_name = local.db_subnet_group_name

  vpc_security_group_ids = [aws_security_group.sg_db_cms.id]

  # Disable monitoring
  monitoring_interval = 0
  # Disable automatic backups
  backup_retention_period = 0
  # Disable encryption and protection
  storage_encrypted = false
  deletion_protection = false
}

