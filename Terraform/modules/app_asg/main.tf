# ---------------- Launch Template ----------------
resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.app_sg_id]

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y httpd
echo "<h1>App Server - $(hostname)</h1>" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app-instance"
    }
  }
}

# ---------------- Auto Scaling Group ----------------
resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 2
  min_size             = 1
  max_size             = 3
  vpc_zone_identifier  = var.app_subnet_ids
  health_check_type    = "EC2"

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  tag {
    key                 = "Name"
    value               = "asg-app-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
