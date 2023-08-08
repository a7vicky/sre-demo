terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.67"
    }
    rhcs = {
      version = ">= 1.1.0"
      source  = "terraform-redhat/rhcs"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "rhcs" {
  token = var.refresh_token
  url   = var.url
}

data "aws_caller_identity" "current" {
}

resource "aws_iam_user" "admin" {
  name = "osdCcsAdmin"
}

resource "aws_iam_user_policy_attachment" "admin_access" {
  user       = aws_iam_user.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "admin_key" {
  user = aws_iam_user.admin.name
}

resource "rhcs_cluster" "my_cluster" {
  name                  = "a7vicky-ccs"
  cloud_provider        = "aws"
  cloud_region          = "us-east-1"
  ccs_enabled           = true
  aws_account_id        = data.aws_caller_identity.current.account_id
  aws_access_key_id     = aws_iam_access_key.admin_key.id
  aws_secret_access_key = aws_iam_access_key.admin_key.secret
}