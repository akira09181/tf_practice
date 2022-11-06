terraform {
    required_version = ""
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~>3.0"
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

valiable "envionment" {
    type = string
}

