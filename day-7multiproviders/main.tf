provider "aws" {
    region = "ap-south-1"
  
}
provider "aws" {
    region = "us-east-1"
  alias = "america"
}
provider "aws" {
    region = "us-east-2"
  alias = "africa"
}






resource "aws_s3_bucket" "name1" {
    bucket = "pooja-sate-mumbai"
}
resource "aws_s3_bucket" "name2" {
    bucket = "pooja-sate-america"
    provider = aws.america
}
resource "aws_s3_bucket" "name3" {
    bucket = "pooja-sate-africa"
    provider = aws.africa
}