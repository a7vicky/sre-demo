terraform {
  required_providers {
    rhcs = {
      version = ">= 1.1.0"
      source  = "terraform-redhat/rhcs"
    }
  }
}


provider "rhcs" {
  token = var.refresh_token
  url   = var.url
}

resource "rhcs_cluster" "my_cluster" {
  name                  = var.cluster_name
  cloud_provider        = "aws"
  cloud_region          = "us-east-1"
  ccs_enabled           = false
  product               = "osd"
  version               = var.openshift_version
}
