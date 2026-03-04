# ------------------------------------------------------------------------------
# Input Variables for Complete Example
#
# This file defines all the input variables required for the complete example.
# Users can customize these values to fit their specific requirements.
# ------------------------------------------------------------------------------

variable "region" {
  description = "The Alibaba Cloud region where resources will be created."
  type        = string
  default     = "cn-beijing"
}

variable "name_prefix" {
  description = "The prefix for naming all resources."
  type        = string
  default     = "es-ai-assistant-example"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "192.168.0.0/16"
}

variable "vswitch_cidr_block" {
  description = "The CIDR block for the VSwitch."
  type        = string
  default     = "192.168.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone where the VSwitch will be created. If not specified, the first available zone will be used."
  type        = string
  default     = null
}

variable "elasticsearch_password" {
  description = "The password for the Elasticsearch instance. Must be 8-30 characters long and contain at least three of the following: uppercase letters, lowercase letters, numbers, and special characters."
  type        = string
  sensitive   = true
}

variable "elasticsearch_version" {
  description = "The version of Elasticsearch."
  type        = string
  default     = "8.17.0_with_X-Pack"
}

variable "data_node_amount" {
  description = "The number of data nodes."
  type        = string
  default     = "2"
}

variable "data_node_spec" {
  description = "The specification of data nodes."
  type        = string
  default     = "elasticsearch.sn1ne.large.new"
}

variable "kibana_node_spec" {
  description = "The specification of Kibana node."
  type        = string
  default     = "elasticsearch.n4.small"
}