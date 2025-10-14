variable "image_id" {
    type = string
  
}

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