variable "object_name" {
  description = "Public IP object name"
  type        = string

  validation {
    condition     = length(trim(var.object_name, " ")) > 0
    error_message = "object_name cannot be empty."
  }
}

variable "vip" {
  description = "Private IP to NAT against"

  type = string

  validation {
    condition     = length(trim(var.vip, " ")) > 0
    error_message = "vip cannot be empty."
  }

  validation {
    condition     = can(cidrhost("${var.vip}/32", 0))
    error_message = "vip must be a valid IPv4 address."
  }
}
variable "availability_zone" {
  description = "Availability Zone"
  type        = string

  validation {
    condition     = length(trim(var.availability_zone, " ")) > 0
    error_message = "availability_zone cannot be empty."
  }
}

variable "policy_rules" {
  description = "Public IP policy rules"

  type = list(object({
    display_name = string
    source       = string
    services     = list(string)
    action       = string
  }))

  default = []

  validation {
    condition = alltrue([
      for r in var.policy_rules :
      length(trim(r.display_name, " ")) > 0
    ])

    error_message = "display_name cannot be empty."
  }

  validation {
    condition = alltrue([
      for r in var.policy_rules :
      length(r.services) > 0
    ])

    error_message = "At least one service must be specified."
  }
}
