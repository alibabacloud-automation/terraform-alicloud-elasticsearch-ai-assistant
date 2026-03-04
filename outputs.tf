# ------------------------------------------------------------------------------
# Module Output Values
#
# This file defines the output values that are returned after the module
# is successfully executed. These outputs can be referenced by other Terraform
# configurations or displayed to users after apply.
# ------------------------------------------------------------------------------

# VPC outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

# VSwitch outputs
output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.id
}

output "vswitch_cidr_block" {
  description = "The CIDR block of the VSwitch"
  value       = alicloud_vswitch.vswitch.cidr_block
}

output "vswitch_zone_id" {
  description = "The zone ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.zone_id
}

# Elasticsearch instance outputs
output "elasticsearch_instance_id" {
  description = "The ID of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.id
}

output "elasticsearch_domain" {
  description = "The domain of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.domain
}

output "elasticsearch_kibana_domain" {
  description = "The Kibana domain of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.kibana_domain
}

output "elasticsearch_port" {
  description = "The port of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.port
}

output "elasticsearch_kibana_port" {
  description = "The Kibana port of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.kibana_port
}

output "elasticsearch_status" {
  description = "The status of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.status
}

output "elasticsearch_public_domain" {
  description = "The public domain of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.public_domain
}

output "elasticsearch_public_port" {
  description = "The public port of the Elasticsearch instance"
  value       = alicloud_elasticsearch_instance.elasticsearch.public_port
}

# Management URLs
output "elasticsearch_console_url" {
  description = "The Elasticsearch instance console URL for management"
  value       = format("https://elasticsearch.console.aliyun.com/%s/instances/%s/base", data.alicloud_regions.current.regions[0].id, alicloud_elasticsearch_instance.elasticsearch.id)
}