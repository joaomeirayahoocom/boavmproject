output "aws_subnet_web" {
  value = aws_subnet.web.id
}

output "aws_subnet_app" {
  value = aws_subnet.app.id
}

output "aws_subnet_db" {
  value = aws_subnet.db.id
}

