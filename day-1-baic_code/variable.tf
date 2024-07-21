variable "ami_id" {
    type =  string
    default = " "                             #### passing from teeraform.tfvars through variable.tf to main
    description = "  value passing to main"
}
variable "instance_type" {
    type = string
    default = " "                                   #### passing from teeraform.tfvars through variable.tf to main
    description = " value passing to main.tf ang get from terraform.tfvar"
  
}
variable "key_name" {
    type = string
    default = "key"                         #####  values passing from variable.tf
    description = "value passing from vaiable "   
  
}