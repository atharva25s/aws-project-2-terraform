terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATCKAPXFYDSA3T3YG"
  secret_key = "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"
}
