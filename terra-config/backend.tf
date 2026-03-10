terraform {
  backend "s3" {
    bucket         = "aman-eks-tf-state-1"
    key            = "3-tier/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
