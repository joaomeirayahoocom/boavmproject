resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tls"
  }

}

resource "aws_vpc_security_group_egress_rule" "inbound" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block]
  security_group_id = aws_security_group.aws-windows.id

}

resource "aws_security_group" "aws-windows-sg" {
  name        = "dev-windows-sg"
  description = "Allow incoming connections"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # tags = {
  ##  Name        = "${lower(var.app_name)}-${var.app_environment}-windows-sg"
 #   Environment = var.app_environment
#  }
}