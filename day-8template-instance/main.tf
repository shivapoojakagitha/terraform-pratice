
resource "aws_vpc" "dev1" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc-cust-public"
    }
}
resource "aws_internet_gateway" "dev1" {
    vpc_id = aws_vpc.dev1.id
    tags ={
        Name = " ig1"
    }
}
resource "aws_subnet" "dev1" {
    vpc_id = aws_vpc.dev1.id
    tags = {
      Name = "subnet-cust-public"
    }
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch =  true       ####### to make  public ip address  enable ######
    availability_zone = "ap-south-1a"       ### some times it taking as "ap-south-1c" which not supported for free-tier or t2micro so availability zones has mentioned"   
}
resource "aws_route_table" "dev1" {
    vpc_id = aws_vpc.dev1.id
    tags = {
      Name = "rt-cust-public-1"
    }
  
  route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.dev1.id
  }
}
resource "aws_route_table_association" "dev1" {
    route_table_id = aws_route_table.dev1.id
    subnet_id = aws_subnet.dev1.id
  
}
resource "aws_security_group" "dev1" {
    vpc_id =  aws_vpc.dev1.id
    tags = {
      Name ="sg"
    }
    ingress {
     to_port = 22
     from_port = 22
     protocol = "tcp"
     cidr_blocks = ["49.204.96.192/32" ]     ##### laptop ip address ----- so allow only my laptop #####
     description = "values of inbound"
    }
    ingress {
        to_port = 80
        from_port = 80
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]      ###### allow all the devices ##########
        description ="inbound values"
    }
    egress{
        to_port = 0
        from_port = 0
        protocol = "-1"  ### "-1" is nonthing but all traffic #####
        description =  "all traffic"
    }
}