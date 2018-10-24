variable "policy_name" {
  description = "Policy name to create or obtain"
  type        = "string"
  default     = ""
}

variable "env_type" {
  description = "Application environment type"
  type        = "string"
  default     = ""
}

variable "resources" {
  description = "Comma separated string"
  type        = "string"
  default     = "*"
}

variable "sts_assume_role_principal_service" {
  description = "STS Assume Role principal service"
  type        = "string"
  default     = "ec2.amazonaws.com"
}
