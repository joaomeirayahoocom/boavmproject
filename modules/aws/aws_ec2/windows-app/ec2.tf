resource "aws_instance" "windows-server" {
  ami                         = var.ami
  instance_type               = "t2_nano"
  subnet_id                   = var.subnet_id
  #vpc_security_group_ids      = [aws_security_group.aws-windows-sg.id]
  associate_public_ip_address = true
  #source_dest_check           = false
  key_name                    = aws_key_pair.key_pair.key_name
 # user_data                   = data.template_file.windows-userdata.rendered
  
  # root disk
  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = true
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "10"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  
  tags = {
    Name        = "windows-server"
    Environment = "dev"
  }
}

# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = "test"  
  public_key = tls_private_key.key_pair.public_key_openssh
}

# Save file
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.key_pair.key_name}.pem"
  content  = tls_private_key.key_pair.private_key_pem
}