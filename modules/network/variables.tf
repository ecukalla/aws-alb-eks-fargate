variable "availability_zones" {
  description = "List of available Availability Zones"
  type = list(string)
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_name" {
  type    = string
  default = "app-name-vpc"
}
