#### INSTANCE ####
#
# Create instance
#
resource "openstack_compute_instance_v2" "instance" {
  for_each    = local.instances
  name        = "soc_${each.key}"
  image_name  = var.image
  flavor_name = var.flavor
  key_pair    = openstack_compute_keypair_v2.user_key[each.key].name
  user_data   = file("first-boot.yml")
  network {
    port = openstack_networking_port_v2.port[each.key].id
  }
}

# Create network port
resource "openstack_networking_port_v2" "port" {
  for_each       = local.instances
  name           = "port_${each.key}"
  network_id     = var.network
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.ssh.id,
  ]
}

# Create floating ip
resource "openstack_networking_floatingip_v2" "fip" {
  for_each    = local.instances
  pool = "vlan11"
}

# Attach floating ip to instance
resource "openstack_compute_floatingip_associate_v2" "fip_assoc" {
  for_each    = local.instances
  floating_ip = openstack_networking_floatingip_v2.fip[each.key].address
  instance_id = openstack_compute_instance_v2.instance[each.key].id
}
