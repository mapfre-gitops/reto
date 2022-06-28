terraform {
  backend "local" {
    path = "/opt/buckets/jamapla/terraform.ftstate"
  }
}%                                                                                                                                                                                            
asanc35@cpees_mad002937 reto-kairos % cat main.tf 
provider "aws" {
  region  = "eu-west-1"
}
resource "aws_s3_bucket" "mapfre-gitops-asanc35" {
  bucket = "mapfre-gitops-asanc35"

  tags = {
    Name        = "mapfre-gitops-asanc35"
    Environment = "Reto-Kairos"
  }
}

resource "aws_s3_bucket_acl" "mapfre-gitops-asanc35" {
  bucket = aws_s3_bucket.mapfre-gitops-asanc35.id
  acl    = "public-read"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.mapfre-gitops-asanc35.id
  key    = "index.html"
  source = "./index.html"
  etag = filemd5("./index.html")
}