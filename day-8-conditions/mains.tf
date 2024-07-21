#######condition ###########
variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type        = string
  nullable    = false
  default     = "us-west-1" #here we need to define either us-west-1 or eu-west-2 if i give other region will get error 
  validation {
    condition = var.aws_region == "us-west-2" || var.aws_region == "eu-west-1"
    error_message = "The variable 'aws_region' must be one of the following regions: us-west-2, eu-west-1"
  }
}
resource "aws_s3_bucket" "dev" {
    bucket = "s33333334444466666"
    
  
}



/*result :thrugh error.....
on main.tf line 7:
│    7: variable "aws_region" {
│     ├────────────────
│     │ var.aws_region is "us-west-1"
│
│ The variable 'aws_region' must be one of the following regions: us-west-2, eu-west-1
│
│ This was checked by the validation rule at main.tf:12,3-13.
*/#---------> shoun error 