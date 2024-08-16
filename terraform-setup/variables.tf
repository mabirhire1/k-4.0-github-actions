variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in"
  type        = string
  default     = "subnet-0730b1eed183be47a"  
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  
}

variable "vpc_id" {
  description = "The ID of the vpc to use for the EC2 instance"
  type        = string
  default     = "vpc-070ef69b988b589b6"  
}

variable "security_group_id_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "sg-0d95b4e12415f1563"  
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"  
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
  default     = "cap_abi"  
}

variable "private_key_path" {
  description = "The file path of the private key to SSH into the EC2 instance"
  type        = string
  default     = "~/.ssh/cap_abi.pem"
}