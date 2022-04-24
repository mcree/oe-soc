# Params file for variables

#### GLANCE
variable "image" {
  type    = string
  default = "Debian_10_Official_amd64"
}

#### NEUTRON
variable "network" {
  type    = string
  default = "5ed213e6-39c9-4334-bdf3-c344d53143a9" # SOCVlan_1
}

#### VM parameters
variable "flavor" {
  type    = string
  default = "m1.medium"
}
