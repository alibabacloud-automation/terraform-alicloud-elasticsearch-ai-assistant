# ------------------------------------------------------------------------------
# Output Values for Complete Example
#
# This file defines the output values that will be displayed after the example
# is successfully applied. These outputs show important information about the
# created resources.
# ------------------------------------------------------------------------------

# Elasticsearch instance information
output "elasticsearch_instance_id" {
  description = "The ID of the Elasticsearch instance"
  value       = module.elasticsearch_ai_assistant.elasticsearch_instance_id
}

output "elasticsearch_domain" {
  description = "The domain of the Elasticsearch instance"
  value       = module.elasticsearch_ai_assistant.elasticsearch_domain
}

output "kibana_domain" {
  description = "The Kibana domain for accessing Kibana interface"
  value       = module.elasticsearch_ai_assistant.elasticsearch_kibana_domain
}

output "kibana_port" {
  description = "The Kibana port"
  value       = module.elasticsearch_ai_assistant.elasticsearch_kibana_port
}

output "elasticsearch_console_url" {
  description = "The Elasticsearch console URL for management"
  value       = module.elasticsearch_ai_assistant.elasticsearch_console_url
}

# Network information
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.elasticsearch_ai_assistant.vpc_id
}

output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = module.elasticsearch_ai_assistant.vswitch_id
}

# Access information
output "kibana_access_url" {
  description = "Complete Kibana access URL"
  value       = format("https://%s:%s", module.elasticsearch_ai_assistant.elasticsearch_kibana_domain, module.elasticsearch_ai_assistant.elasticsearch_kibana_port)
}

output "elasticsearch_access_url" {
  description = "Complete Elasticsearch access URL"
  value       = format("https://%s:%s", module.elasticsearch_ai_assistant.elasticsearch_domain, module.elasticsearch_ai_assistant.elasticsearch_port)
}

# Status information
output "elasticsearch_status" {
  description = "The status of the Elasticsearch instance"
  value       = module.elasticsearch_ai_assistant.elasticsearch_status
}