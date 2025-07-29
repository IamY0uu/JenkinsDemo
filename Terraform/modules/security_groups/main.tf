# ---------------- Web SG ----------------
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  vpc_id      = var.vpc_id
  description = "Allow HTTP from anywhere"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

# ---------------- App SG ----------------
resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  vpc_id      = var.vpc_id
  description = "Allow HTTP from Web tier"

  ingress {
    description      = "Allow HTTP from Web SG"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}

# ---------------- DB SG ----------------
resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  vpc_id      = var.vpc_id
  description = "Allow MySQL from App tier"

  ingress {
    description      = "Allow MySQL from App SG"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}
