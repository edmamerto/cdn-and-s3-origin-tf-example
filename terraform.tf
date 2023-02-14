variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "env" {
  type = string
}

variable "domain_name" {
  type = string
}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
  version = "~> 4.0"
}


module "cdn" {
  source = "./modules/terraform/cdn"
  bucket_domain_name = module.website.bucket_domain_name
  env = var.env
  domain_name = var.domain_name
}

module "website" {
  source = "./modules/terraform/site"
  env = var.env
  domain_name = var.domain_name
  origin_access_identity = module.cdn.origin_access_identity
}
