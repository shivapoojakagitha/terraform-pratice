variable "ami_id" {
    type =  string
    default = "ami-0ec0e125bb6c6e8ec"                           
    description = "  value passing to main"
}
variable "instance_type" {
    type = string
    default = "t2.micro"                                   
    description = " value passing to main.tf ang get from terraform.tfvar"
  
}
variable "key_name" {
    type = string
    default = "key"                     
    description = "value passing from vaiable "   
  
}