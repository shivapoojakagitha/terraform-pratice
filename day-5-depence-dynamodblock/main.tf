
##create vpc ####
resource "aws_vpc" "dev1" {
    cidr_block = "10.0.0.0/16"
    tags ={
        Name = "vpc1"
    }
  
}
#####  create  ig and attach to vpc ######

resource "aws_internet_gateway" "dev1" {
    vpc_id = aws_vpc.dev1.id
    tags ={
        Name = "ig1"
    }
  
}
##### create subnets #####
resource "aws_subnet" "dev1" {
    vpc_id = aws_vpc.dev1.id
     availability_zone = "ap-south-1b"
    tags = {
      Name = "sub-public"
            }
      cidr_block = "10.0.0.0/24" 
       map_public_ip_on_launch = true 
}
resource "aws_route_table" "dev1" {
    vpc_id = aws_vpc.dev1.id
    tags = {
      Name ="rt_public"
    }
       
    ### EDIT ROUTE TABLE ########
  route {
    cidr_block ="0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev1.id
  }

}
####### subnet associate   ########
resource "aws_route_table_association" "dev1" {
    subnet_id = aws_subnet.dev1.id
    route_table_id = aws_route_table.dev1.id  
}
###### security group ######

   resource "aws_security_group" "dev1" {
    vpc_id = aws_vpc.dev1.id
    tags = {
      Name ="sg-public"
    }
     
     ingress {
        from_port = 80
        to_port = 80
        description = "traffic"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
     }

     ingress { 
        from_port = 22
        to_port = 22
        description = "traffic"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
     }
     egress {
        from_port = 0
        to_port = 0
        description = "all traffic"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
     }
   
    }

    ####### nat gateway #######
    resource "aws_nat_gateway" "prt" {
        subnet_id = aws_subnet.dev1.id
        allocation_id = aws_eip.prt.id
        tags = {
          Name ="nate_gateway"
        }
      
    }
    ######### elastic  ip ########
    resource "aws_eip" "prt" {
        domain = "vpc"
      
    }
    ###### routetable ########
    resource "aws_route_table" "prt" {
        tags = {
          Name = "privte_rt"
        }
        vpc_id = aws_vpc.dev1.id

        ###### edit routes #######
        route{
            cidr_block = "0.0.0.0/0"
            gateway_id =aws_nat_gateway.prt.id 
        }
    
    }
    ######## subnets ######
    resource "aws_subnet" "prt" {
        vpc_id = aws_vpc.dev1.id
        tags = {
          Name ="prt-subnet"
        }
      cidr_block = "10.0.1.0/24"
    } 

    ####### subnet associate #####
    
    resource "aws_route_table_association" "prt" {
        
        subnet_id = aws_subnet.prt.id
        route_table_id = aws_route_table.prt.id


      
    }
  
