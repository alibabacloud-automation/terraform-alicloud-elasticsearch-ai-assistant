# ------------------------------------------------------------------------------
# Core Resource Definitions
#
# This file contains the core infrastructure resources for the module.
# The code here is responsible for creating and configuring all cloud resources
# based on input variables.
# ------------------------------------------------------------------------------

# Get current region information
data "alicloud_regions" "current" {
  current = true
}

# Create VPC
resource "alicloud_vpc" "vpc" {
  cidr_block = var.vpc_config.cidr_block
  vpc_name   = var.vpc_config.vpc_name

  tags = var.common_config.tags
}

# Create VSwitch
resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_config.cidr_block
  zone_id      = var.vswitch_config.zone_id
  vswitch_name = var.vswitch_config.vswitch_name

  tags = var.common_config.tags
}

# Create Elasticsearch instance
resource "alicloud_elasticsearch_instance" "elasticsearch" {
  payment_type     = var.elasticsearch_config.payment_type
  vswitch_id       = alicloud_vswitch.vswitch.id
  version          = var.elasticsearch_config.version
  zone_count       = var.elasticsearch_config.zone_count
  kibana_whitelist = var.elasticsearch_config.kibana_whitelist
  password         = var.elasticsearch_config.password
  description      = var.elasticsearch_config.description

  data_node_configuration {
    amount            = var.elasticsearch_config.data_node_amount
    disk              = var.elasticsearch_config.data_node_disk_size
    disk_type         = var.elasticsearch_config.data_node_disk_type
    performance_level = var.elasticsearch_config.data_node_disk_performance_level
    spec              = var.elasticsearch_config.data_node_spec
  }

  kibana_configuration {
    spec = var.elasticsearch_config.kibana_node_spec
  }

  tags = var.common_config.tags
}