
terraform {
  required_version = ">= 0.12"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
#provider "openstack" {
#  user_name   = "admin"
#  tenant_name = "admin"
#  password    = "pwd"
#  auth_url    = "https://cloud.hbit.sztaki.hu:5000/v2.0"
#  region      = "RegionOne"
#}
