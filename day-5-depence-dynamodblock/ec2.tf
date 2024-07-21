resource "aws_instance" "dev1" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "key"
    subnet_id = aws_subnet.dev1.id
    vpc_security_group_ids = [aws_security_group.dev1.id]
    tags = {
      Name ="ec3-public"
    } 
  
    
  
}
resource "aws_instance" "prt" {
    ami ="ami-01376101673c89611"
    key_name = "key"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.prt.id
   vpc_security_group_ids = [aws_security_group.dev1.id]
    tags = {
      Name="ec3-prvt"
    }
  depends_on = [ aws_instance.dev1 ]
  
}



