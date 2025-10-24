variable "instance_type" {
    type = string
  
}

variable "desired_capacity" {
    type = number
  
}

variable "min_size" {
    type = number
  
}
variable "max_size" {
    type = number
}

variable "vpc_id" {
    type = string
  
}

variable "subnet_ids" {
    type = list(string)
  
}

variable "name_prefix" {
    type = string
}

variable "volume_size" {
    type = number
  
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "cloudtechdev1"
}

