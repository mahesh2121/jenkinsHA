provider "aws" {
    region = "ap-south-1"
  
}

variable "instance_type" { 
    type = "string"
    default = "t2.small"
}

variable "ami_id" {
    type= "string"
    default = ""
}

variable "instance_name" {
    type = "string"
    description = "test-instance"
}

variable "security_group_name" {
    type = list(string)
    default = [""]
}

variable "key_name" {
    type = string
    default = "cloudx"

}

variable "instance_count" {
    type = number
    default = 1
}

variable "subnet_ids" {
    type = list(string)
    default = ["","",""]
}