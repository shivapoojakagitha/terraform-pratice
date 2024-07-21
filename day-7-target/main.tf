
resource "aws_s3_bucket" "name" {
    bucket = "my414752"
  
}
resource "aws_instance" "name" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
      Name ="day7"

    }
    depends_on = [ aws_s3_bucket.name ]
}
 
##### target commands #####
# 1.it will help to creat only target  resource
#2.terraform apply -target= aws_instance.name  ---> i was targeted to install only ec2instance

##### simarly dependencey also it will create requeste resource first #####
# depends_on = [ aws_s3_bucket.name ]  --------> it will create first bucket next automatically create instance ec2.#####