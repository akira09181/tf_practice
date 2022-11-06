terraform {
    required_version = ">=1.3"
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~>4.0"
        }
    }
}

provider "aws" {
    profile = "terraform"
    region = "ap-northeast-1"
}

variable "project" {
    type = string
}

variable "envionment" {
    type = string
}

