# Application settings

variable "app_name" {
  description = "Application name"
  type        = "string"
}

variable "env_type" {
  description = "Application environment type"
  type        = "string"
  default     = "dev"
}

variable "app_version" {
  description = "Application versions"
  type        = "string"
  default     = "0.1"
}

# ECR Repo settings

variable "ecr_repo_prefix" {
  description = "ECR Repo prefix"
  type        = "string"
  default     = "mysite"
}
