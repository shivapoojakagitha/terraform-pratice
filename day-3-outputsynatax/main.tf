resource "aws_instance" "dev1" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "key" 
    tags = {
      Name ="ec3-public"
    } 
    associate_public_ip_address =  true  
  
}
resource "aws_instance" "prt" {
    ami ="ami-01376101673c89611"
    key_name = "key"
    instance_type = "t2.micro"
   tags = {
      Name="ec3-prvt"
    }
}