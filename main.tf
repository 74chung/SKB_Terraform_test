#=========================
# Deploying VMware VM
#=========================
# Connect to VMware vSphere vCenter
#---------------------------------------------------------
provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere_unverified_ssl
}

# Define VMware vSphere
#---------------------------------------------------------
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

#data "vsphere_compute_cluster" "cluster" {
#  name          = var.vsphere_compute_cluster
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "public" {
  name          = var.vsphere_network_public
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "private" {
  name          = var.vsphere_network_private
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "mgmt" {
  name          = var.vsphere_network_mgmt
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Define VM Template
#---------------------------------------------------------
data "vsphere_virtual_machine" "template" {
name = "/${var.vsphere_datacenter}/vm/${var.vsphere_template_folder}/${var.vm_template_name}"
datacenter_id = data.vsphere_datacenter.dc.id 
} 

#data "vsphere_distributed_virtual_switch" "vds"{
#name = var.vm-dvs
#datacenter_id = data.vsphere_datacenter.dc.id
#}

#data "vsphere_vnic" "vnic" {
#  name = var.vm-nic
#  portgroup = vsphere_host_port_group.p1.name
#  ipv4 {
#    dhcp = false
#  }
#}

# Create VMs
#---------------------------------------------------------
resource "vsphere_virtual_machine" "vm" {
  count            = var.vm_count
  name             = var.vm_name
#  firmware = var.vm-firmware
#  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.vm_cpu
  memory           = var.vm_mem
  guest_id         = data.vsphere_virtual_machine.template.guest_id # The guest ID for the operating system type. Default: otherGuest64.
#  wait_for_guest_net_routable = false
#  wait_for_guest_net_timeout = 0
#  wait_for_guest_ip_timeout  = 0
  network_interface {
    network_id = data.vsphere_network.public.id
  }
  network_interface {
    network_id = data.vsphere_network.private.id
  }
  network_interface {
    network_id = data.vsphere_network.mgmt.id
  }
  disk {
    label = var.vm_disk_label
    size  = var.vm_disk_size # The size of the disk, in GB. Must be a whole number.
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {  # This allows the user to configure the virtual machine post-clone
#      timeout = 0  # The default is 10 minutes, Setting the value to 0 or a negative value disables the waiter.
      linux_options {
        host_name = var.vm_name
        domain    = "example.com"
      }
      network_interface {}
      network_interface {}
      network_interface {}
      ipv4_gateway = "${var.vm_ipv4_gw}"
    }
  }
}
