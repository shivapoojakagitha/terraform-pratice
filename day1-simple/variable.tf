variable "ami_id" {
    default = "ami-01376101673c89611"
    type = string
    description = "passing ami values from variable to main "
  
}
variable "key_name" {
    type = string
    default = "key"
    description = " key values to main"

  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "instance type value to main"
  
}