variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region"
}

variable "ecr_values" {
  type        = any
  default     = {}
  description = "AWS ECR configuration"
}

variable "ecs_values" {
  type        = any
  default     = {}
  description = "AWS ECS configuration"
}

variable "lb_values" {
  type        = any
  default     = {}
  description = "AWS Load Balancer configuration"
}

variable "vpc" {
  type        = any
  default     = "vpc-9b19c1f0"
  description = "AWS VPC configuration"
}

variable "container" {
  type        = any
  default     = {}
  description = "Container configuration to deploy"
}