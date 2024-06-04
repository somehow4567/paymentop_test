provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "paymentop-test-pavlo-backend"
    key    = "paymentop_test/backend/terraform.tfstate"
    region = "us-east-1"
  }
}