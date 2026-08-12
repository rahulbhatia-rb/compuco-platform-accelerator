variable "aws_region" {
  type        = string
  description = "AWS region for the reference stack"
  default     = "eu-west-2"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "demo"
}

variable "name" {
  type        = string
  description = "Workload name"
  default     = "compuco-demo"
}

variable "cost_center" {
  type        = string
  description = "Logical cost allocation tag"
  default     = "platform"
}

variable "vpc_cidr" {
  type    = string
  default = "10.40.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.40.0.0/24", "10.40.1.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.40.10.0/24", "10.40.11.0/24"]
}

variable "log_retention_days" {
  type    = number
  default = 30
}
