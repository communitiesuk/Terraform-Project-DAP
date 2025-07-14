resource "aws_instance" "kali_vm" {
  count                       = var.kali_instance_count
  ami                         = var.kali_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet.id
  vpc_security_group_ids      = [aws_security_group.kali_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = false
 
  tags = {
    Name = "kali-vm-${count.index + 1}"
  }
}