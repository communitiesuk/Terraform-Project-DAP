
data "aws_vpc" "existing" {
  id = var.existing_vpc_id
}


resource "aws_subnet" "private_subnet" {
  vpc_id                  = data.aws_vpc.existing.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = "kali-private-subnet"
  }
}

# # (Optional) Get the Internet Gateway attached to the existing VPC
# data "aws_internet_gateway" "existing_igw" {
#   filter {
#     name   = "attachment.vpc-id"
#     values = [var.existing_vpc_id]
#   }
# }

# # (Optional) Create a route table and associate it with the subnet
# resource "aws_route_table" "private_rt" {
#   vpc_id = data.aws_vpc.existing.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = data.aws_internet_gateway.existing_igw.id
#   }

#   tags = {
#     Name = "kali-private-rt"
#   }
# }

# resource "aws_route_table_association" "private_rt_assoc" {
#   subnet_id      = aws_subnet.private_subnet.id
#   route_table_id = aws_route_table.private_rt.id
# }
