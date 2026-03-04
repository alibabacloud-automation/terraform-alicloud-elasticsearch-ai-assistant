# ------------------------------------------------------------------------------
# Module Input Variables
#
# This file defines all configurable input variables for this Terraform module.
# Each variable includes a detailed description to help users configure the module correctly.
# ------------------------------------------------------------------------------

variable "common_config" {
  description = "Common configuration for all resources including tags."
  type = object({
    tags = optional(map(string), {})
  })
  default = {
    tags = {}
  }
}

variable "vpc_config" {
  description = "Configuration for VPC. The attribute 'cidr_block' is required."
  type = object({
    cidr_block = string
    vpc_name   = optional(string, "elasticsearch-ai-assistant-vpc")
  })
  default = {
    cidr_block = "192.168.0.0/16"
    vpc_name   = "elasticsearch-ai-assistant-vpc"
  }
}

variable "vswitch_config" {
  description = "Configuration for VSwitch. The attributes 'cidr_block' and 'zone_id' are required."
  type = object({
    cidr_block   = string
    zone_id      = string
    vswitch_name = optional(string, "elasticsearch-ai-assistant-vswitch")
  })
}

variable "elasticsearch_config" {
  description = "Configuration for Elasticsearch instance. The attributes 'password', 'kibana_whitelist' are required."
  type = object({
    password                         = string
    kibana_whitelist                 = list(string)
    payment_type                     = optional(string, "PayAsYouGo")
    version                          = optional(string, "8.17.0_with_X-Pack")
    zone_count                       = optional(number, 1)
    data_node_disk_type              = optional(string, "cloud_essd")
    data_node_disk_size              = optional(string, "20")
    data_node_amount                 = optional(string, "2")
    data_node_spec                   = optional(string, "elasticsearch.sn1ne.large.new")
    kibana_node_spec                 = optional(string, "elasticsearch.n4.small")
    data_node_disk_performance_level = optional(string, "PL1")
    description                      = optional(string, "elasticsearch-ai-assistant-instance")
  })
}