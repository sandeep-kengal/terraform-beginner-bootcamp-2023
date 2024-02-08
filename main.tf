terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
      aws = {
    source = "hashicorp/aws"
    version = "5.35.0"
  }
}
}

provider "aws" {
  # Configuration options
}


provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length = 32
  special = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}

