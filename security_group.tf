resource "aws_security_group" "kali_sg" {
  name        = "kali-private-sg"
  description = "Allow SSH and internal TCP communication"
  vpc_id      = data.aws_vpc.existing.id
 
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    description = "Internal TCP"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "kali-security-group"
  }
}