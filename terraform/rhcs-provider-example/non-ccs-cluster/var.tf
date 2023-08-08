variable "ocm_environment" {
  type    = string
  default = "staging"
}

variable "openshift_version" {
  type = string
  default = "openshift-v4.12.12"
}

variable "refresh_token" {
  type        = string
}

variable "url" {
  type        = string
  description = "Provide OCM environment by setting a value to url"
  default     = "https://api.stage.openshift.com"
}

variable "cluster_name" {
  type    = string
  default = "a7vicky-non-ccs"
}
