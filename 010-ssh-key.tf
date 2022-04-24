# Define ssh to config in instance

resource "openstack_compute_keypair_v2" "user_key" {
  for_each   = local.instances
  name       = "key_${each.key}"
  public_key = each.value.ssh_key
}
