region              = "us-east-1"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
app_subnet_cidrs    = ["10.0.2.0/24", "10.0.3.0/24"]
db_subnet_cidrs     = ["10.0.4.0/24", "10.0.5.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]

ami_id        = "ami-0150ccaf51ab55a51"
instance_type = "t2.micro"
key_pair      = "LLB"
db_username   = "admin"
db_password   = "password1234"
