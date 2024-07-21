##############   statefile in to s3 ##############
terraform {
 backend "s3" {
    bucket = "bucket81799"
    key = "day5/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamo_s3_store"
    encrypt = true
   
 }
}

