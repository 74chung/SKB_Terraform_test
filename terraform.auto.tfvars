#=========================
# Deploying VMware VM
#=========================
# Connect to VMware vSphere vCenter
#---------------------------------------------------------
# VMware vSphere username
#vsphere_user = "" # Terraform Ent의 sensitive Variables로 등록

# VMware vSphere password
#vsphere_password = "" # Terraform Ent의 sensitive Variables로 등록

# VMware vSphere server address
#vsphere_server = "" # Terraform Ent의 sensitive Variables로 등록

# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"

# Define VMware vSphere
#---------------------------------------------------------
# vSphere datacenter name where the infrastructure will be deployed
vsphere_datacenter = "dc1"

# vSphere Datastore used to deploy VMs
vsphere_datastore = "datastore1"

# vSphere resource pool name where the infrastructure will be deployed
vsphere_resource_pool = "cluster1/resource"

# vSphere Network used to deploy VMs
vsphere_network_public  = "network_public"
vsphere_network_private = "network_private"
vsphere_network_mgmt    = "network_mgmt"

# Define VM Template
#---------------------------------------------------------
vsphere_template_folder = "template-folder"
vm_template_name = "CentOS8_Default"

# Create VMs
#---------------------------------------------------------
vm_count = "1"
vm_name = "terraformdev"

vm_cpu = "2"
vm_mem = "4096"
vm_disk_label = "disk0"
vm_disk_size = "50"

vm_ipv4_gw = "172.21.4.1"
