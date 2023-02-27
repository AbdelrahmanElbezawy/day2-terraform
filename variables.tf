variable "cred" {
  description = "credential file path"
  type = list(string)
  default = []
}
variable "profile" {
  description = "set to get specific section in credential file"
  type = string
  default = null
}
variable "region" {
  description = "work region"
  type = string
  default = ""
}
#vpc_variables
variable "vpc_name"{
    description = "name used to create vpc"
    type = string
    default = "ITI_VPC"
}
variable "vpc_cidr"{
    description ="IPv4 CIDR for vpc"
    type = string
    default = ""

}
variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}
############
#internet_gateway_variables
variable "gw_name"{
    description = "name used to create gw"
    type = string
    default = "ITI_GW"
}
############
#subnets
variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = []
}
variable "subnet_cidr" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "subnet_name" {
  description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated."
  type        = list(string)
  default     = []
}
variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  type        = list(bool)
  default     = []
}
variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}
############
#elastic_ip
variable "eip_name" {
    description = "name used to create eip"
    type = string
    default = "ITI_EIP"
}
############
#nat_gateway
variable "nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true
}
variable "nat_name" {
    description = "name used to create ngw"
    type = string
    default = "ITI_NGW"
}
############
#public_route_table
variable "rt_cidr_block" {
  description = "Used to pass a specific distination, the default 0.0.0.0/0 is used as a destination route."
  type        = string
  default     = "0.0.0.0/0"
}
variable "pub_rt_name" {
    description = "name used to create public_route_table"
    type = string
    default = "ITI_Public_route_table"
}
############
#private_route_table
variable "priv_rt_name" {
    description = "name used to create private_route_table"
    type = string
    default = "ITI_Private_route_table"
}
############
#security_group
variable "SG_name" {
    description = "name used to create security group"
    type = string
    default = "ITI_SG"
}
############
#EC2
variable "ami_id" {
    description = "ami id"
    type = string
    default = null
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}
variable "ec2_name" {
    description = "name used to create ec2 instance"
    type = list(string)
    default = []
}