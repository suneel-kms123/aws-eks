variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
    default =   "my-cluster-123"
}

variable "cluster_version" {
    description = "The desired Kubernetes version for the EKS cluster"
    type        = string
    default = "1.27"
}

variable "private_subnets" {
    description = "A list of private subnets inside the VPC"
    type        = list(string)
    default = ["174.0.1.0/24", "174.0.2.0/24"]  
}

variable "public_subnets" {
    description = "A list of public subnets inside the VPC"
    type        = list(string)
    default = ["174.0.3.0/24", "174.0.4.0/24"] 
}

variable "vpc_name" {
    description = "The name of the VPC"
    type        = string
    #default = "my-vpc-123"
}

#get the value from terraform.tfvars
variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    #default = "174.0.0.0/16"  
}

variable "azs" {
    description = "The availability zones for the subnets"
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b"]  
}