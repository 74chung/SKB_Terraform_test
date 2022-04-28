#=========================
# Deploying VMware VM
#=========================
# Connect to VMware vSphere vCenter
#---------------------------------------------------------
variable "vsphere_user" {
  type = string 
  description = "vCenter/vSphere 계정"
}  

variable "vsphere_password" {
  type = string
  description = "vCenter/vSphere 패스워드"
}

variable "vsphere_server" {
  type = string
  description = "vCenter/vSphere 서버 FQDN / IP"
  default = "172.21.0.200"
}

variable "vsphere_unverified_ssl" {
  type = string
  description = "자체 서명 된 인증서를 사용하는 VMware vCenter (true / false)"
  default = true
}

# Define VMware vSphere
#---------------------------------------------------------
variable "vsphere_datacenter" {
  type = string
  description = "VMWare vSphere datacenter 이름"
  default = "dc"
}

variable "vsphere_datastore" {
  type = string
  description = "VMWare vSphere datastore 이름"
  default = "datastore"
}

#variable "vsphere_compute_cluster" {
#  type = string
#  description = "VMWare vSphere cluster 이름"
#  default = "cluster"
#}

variable "vsphere_resource_pool" {
  type = string
  description = "VMWare vSphere resource pool 이름"
  default = "cluster1/Resources"
}

variable "vsphere_network_public" {
  type = string
  description = "VMWare vSphere Network_public 이름"
  default = "network_public"
}

variable "vsphere_network_private" {
  type = string
  description = "VMWare vSphere Network_private 이름"
  default = "network_private"
}

variable "vsphere_network_mgmt" {
  type = string
  description = "VMWare vSphere Network_mgmt 이름"
  default = "network_mgmt"
}

# Define VM Template
#---------------------------------------------------------
variable "vsphere_template_folder" {
type = string
description = "Template folder 이름"
default = "template-folder"
}

variable "vm_template_name" {
type = string
description = "가상머신을 배포할 템플릿 이름"
default = "redhat_packer"
}

#variable "vm-dvs"{
#type = string
#description = "분산 스위치"
#default = "vDSwitch-Eth2"
#}

# Create VMs
#---------------------------------------------------------
variable "vm_count" {
  type = string
  description = "생성 할 VM 갯수"
  default =  1
}

variable "vm_name" {
  type = string
  description = "가상머신 이름"
}

variable "vm_cpu" {
  type = string
  description = "가상머신 CPU 개수"
  default = "1"
}

variable "vm_mem" {
  type = string
  description = "가상머신 Memory 사이즈"
  default = "2048"
}

#variable "vm_guest_id" {
#  type = string
#  description = "가상머신 OS명"
#  default = "rhel7_64Guest"
#}

variable "vm_disk_label" {
  type = string
  description = "가상머신 Disk Label"
  default = "disk0"
}

variable "vm_disk_size" {
  type = string
  description = "가상머신 Disk 사이즈"
  default = "30"
}

#variable "vm-firmware" {
#type = string
#description = "가상머신 fireware set (efi / bios)"
#default = "efi"
#}

#variable "vm-pg"{
#type = string
#description = "분산 스위치 포트그룹"
#default = "sk-pg-48"
#}

#variable "vm-ipv4"{
#type = string
#description = "ipv4 address"
#default = "172.21.4.48"
#}

#variable "vm-netmask"{
#type = string
#description = "netmask"
#default = "24"
#}

variable "vm_ipv4_gw"{
type = string
description = "gateway"
default = "172.21.4.1"
}
