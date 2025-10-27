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

variable "key_name" {
  type        = string
  description = "EC2 key pair to use for instance"
  default     = "cloudtechdev1"
}

variable "instance_profile_name" {
  type        = string
  description = "Name of the IAM instance profile attached to your role"
  default     = "AdminSSMRole"
}

