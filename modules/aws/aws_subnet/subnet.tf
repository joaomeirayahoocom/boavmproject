resource "aws_subnet" "web" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_web
    tags = {
      Name   = "Main"
      env    = "dev"
      source = "subnet_db"
   } 
}

resource "aws_subnet" "app" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_app

  tags = {
    Name   = "Main"
    env    = "dev"
    source = "subnet_app"
  }
}

resource "aws_subnet" "db" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_db

   tags = {
    Name   = "Main"
    env    = "dev"
    source = "Subnet_db"
  } 
}