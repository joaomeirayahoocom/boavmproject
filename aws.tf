/*
module "aws_vpc" {

  source    = "./modules/aws/aws_vpc" 
  vpc_block = var.vpc_block
}
module "aws_subnet" {

  source = "./modules/aws/aws_subnet" 
  vpc_id = module.aws_vpc.vpc_id
  subnet_app = var.subnet_app
  subnet_db = var.subnet_db
  subnet_web = var.subnet_web
}
*/
/*
module "security_group" {

  source     = "./modules/aws/security_group" 
  vpc_id     = module.aws_vpc.vpc_id
  cidr_block = module.aws_vpc.vpc_cidr_block
}*/

/*
module "aws_subnet" {

  source = "./modules/aws/aws_subnet" 
  vpc_id = module.aws_vpc.vpc_id
  subnet_app = var.subnet_app
  subnet_db = var.subnet_db
  subnet_web = var.subnet_web
}

module "ec2_web" {

    source = "./modules/aws/aws_ec2/windows_web" 
    ami    = var.image-windows
    instance_type = var.instance_type
    subnet_id = module.aws_subnet.aws_subnet_web
}

*/


#Start instance creation
#resource "aws_instance" "SD-DEV-WIN-TABLEAU-01" {
/*
  ami           = var.windows_image
  instance_type = var.instance_type
  subnet_id     = var.ec2_subnet
  key_name      = var.key_name
  monitoring    = true
  #security_groups = [aws_security_group.tableau.id]

  root_block_device {

    volume_size = 80

    tags = {
      Name = "OS-volume"
    }

  }

  lifecycle {

    ignore_changes = [ami]

  }

  tags = {
    Name = "SD-DEV-WIN-TABLEAU-01"
  }

}*/
#End instance code
/*
#Start assigning EIP to our instance
resource "aws_eip" "SD-DEV-WIN-TABLEAU-01" {

  instance = aws_instance.SD-DEV-WIN-TABLEAU-01.id
  tags = {
    Name = "SD-DEV-WIN-TABLEAU-01-eip"
  }
}
#End EIP assigment code

#Start create EBS volume 
resource "aws_ebs_volume" "data-vol" {

  availability_zone = var.aval_zone
  size              = 100

  tags = {
    Name = "data-volume"
  }
}
#End create EBS volume 

#Start attach with our instance
resource "aws_volume_attachment" "SD-DEV-WIN-TABLEAU-01" {

  device_name = var.data_drive
  volume_id   = aws_ebs_volume.data-vol.id
  instance_id = aws_instance.SD-DEV-WIN-TABLEAU-01.id

}
#EBSattach with our instance Ended

#Start SG creation
resource "aws_security_group" "tableau" {

  name        = "allow_rules_tableau"
  description = "Allow inbounded and outcounded traffic to tableau"
  #description = "Managed by Terraform- allow in/out traffic to tableau"

  vpc_id = var.vpc_id

  ingress {

    description = "HTTPS-TO-TABLEAU"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  ingress {

    description = "HTTP-TO-TABLEAU"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  ingress {

    description = "SSH from VPN"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  ingress {

    description = "TABLEAU-SERVICE-MANAGER"
    from_port   = 8850
    to_port     = 8850
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  ingress {

    description = "POSTGRESQL-DATABASE"
    from_port   = 8860
    to_port     = 8860
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  ingress {

    description = "POSTGRESQL-BACKUP-VERIFICATION-PORT"
    from_port   = 8861
    to_port     = 8861
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  ingress {

    description = "PORTS-FOR-TABLEAU-LICENSE"
    from_port   = 27000
    to_port     = 27009
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  ingress {

    description = "RDP-TO-TABLEAU"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]

  }

  egress {

    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = {
    Name = "allow_rules_tableau"
  }

}
#Ends SG creation

#Start adding Sg to tableau sg
resource "aws_security_group_rule" "public-web-80" {

  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  description              = "public_web_from_public_web_sg"
  source_security_group_id = var.public_web_sg_id
  security_group_id        = aws_security_group.tableau.id

}
resource "aws_security_group_rule" "public-web-443" {

  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  description              = "public_web_from_public_web_sg"
  source_security_group_id = var.public_web_sg_id
  security_group_id        = aws_security_group.tableau.id

}

resource "aws_security_group_rule" "public-web-5000" {

  type                     = "ingress"
  from_port                = 5000
  to_port                  = 5000
  protocol                 = "tcp"
  description              = "public_web_from_public_web_sg"
  source_security_group_id = var.public_web_sg_id
  security_group_id        = aws_security_group.tableau.id

}

resource "aws_security_group_rule" "public-web-8000" {

  type                     = "ingress"
  from_port                = 8000
  to_port                  = 8000
  protocol                 = "tcp"
  description              = "public_web_from_public_web_sg"
  source_security_group_id = var.public_web_sg_id
  security_group_id        = aws_security_group.tableau.id

}

resource "aws_security_group_rule" "rds-pgSQL" {

  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  description              = "rds-postgress_from_rds_pgSQL_sg"
  source_security_group_id = var.rds_pgSQL_sg_id
  security_group_id        = aws_security_group.tableau.id
}

resource "aws_security_group_rule" "ssh-allowed" {

  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  description              = "ssh-allowed_from_ssh_sg"
  source_security_group_id = var.ssh_allowed_id
  security_group_id        = aws_security_group.tableau.id

}
#End adding security group to tableau sg

#peering creation from sd to vkfw1
resource "aws_vpc_peering_connection" "owner" {
  
  peer_owner_id = var.vkfw1-account
  peer_vpc_id   = var.vpc_id_vkfw1_cf1
  vpc_id        = var.vpc_id
  peer_region   = var.aws_region
  tags = {
    Name = "peer_to_owner"
  }
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  provider                  = aws.vkfw1
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
  auto_accept               = false
  tags = {
    Name = "peer_to_owner"
  }
}

resource "aws_route" "owner" {
  route_table_id            = var.serdel_route_tables
  destination_cidr_block    = "172.30.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
}

resource "aws_route" "accepter" {
  provider                  = aws.vkfw1
  route_table_id            = var.vkfw1_route_tables
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
}*/