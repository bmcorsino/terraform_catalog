variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "net-dev-rg-01-ne"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "net-shr-vnet-01-ne"
}

variable "subnet_names" {
  description = "A list of public subnets inside the vnet."
  default     = ["net-shr-subnet-mng-10.218.0.32_27", "net-dr-shr-subnet-authsvc-10.218.0.128_25", "net-dr-shr-subnet-rproxyin-10.218.3.0_25", "net-dr-shr-subnet-rproxymng-10.218.0.64_28", "net-dr-shr-subnet-fwextout-10.218.2.128_25", "net-dr-shr-subnet-rproxyout-10.218.4.0_22", "net-dr-shr-subnet-fwintout-10.218.1.128_25", "net-dr-shr-subnet-shrservices-10.218.3.128_25", "GatewaySubnet", "net-dr-shr-subnet-fwintin-10.218.1.0_25", "net-dr-shr-subnet-fwextin-10.218.2.0_25"]
}

variable "nsg_name" {
    description = "Default network security group name"
    default = "net-dr-shr-nsg-01"  
}

