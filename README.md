Alibaba Cloud Elasticsearch AI Assistant Terraform Module

# terraform-alicloud-elasticsearch-ai-assistant

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/blob/main/README-CN.md)

Terraform module which creates Elasticsearch AI Assistant infrastructure on Alibaba Cloud. This module implements the solution for [Elasticsearch AI Assistant for intelligent O&M](https://www.aliyun.com/solution/tech-solution/elasticsearch-ai-assistant), which involves the creation and deployment of resources such as Virtual Private Cloud (VPC), Virtual Switch (VSwitch), and Alibaba Cloud Elasticsearch instance. The module provides a complete infrastructure setup for intelligent operations and maintenance using Elasticsearch and Kibana.

## Usage

This module creates a complete Elasticsearch AI Assistant infrastructure including VPC, VSwitch, and Elasticsearch instance with Kibana. It's designed for intelligent operations and maintenance scenarios.

```terraform
module "elasticsearch_ai_assistant" {
  source = "alibabacloud-automation/elasticsearch-ai-assistant/alicloud"

  # Common configuration with tags
  common_config = {
    tags = {
      Environment = "production"
      Project     = "ai-assistant"
    }
  }

  # VPC configuration
  vpc_config = {
    cidr_block = "192.168.0.0/16"
    vpc_name   = "my-es-ai-assistant-vpc"
  }

  # VSwitch configuration (zone_id is required)
  vswitch_config = {
    cidr_block   = "192.168.1.0/24"
    zone_id      = "cn-hangzhou-i"
    vswitch_name = "my-es-ai-assistant-vswitch"
  }

  # Elasticsearch configuration
  elasticsearch_config = {
    password         = "YourSecurePassword123!"
    kibana_whitelist = ["192.168.1.100/32", "10.0.0.0/8"]
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_elasticsearch_instance.elasticsearch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/elasticsearch_instance) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_regions.current](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_config"></a> [common\_config](#input\_common\_config) | Common configuration for all resources including tags. | <pre>object({<br/>    tags = optional(map(string), {})<br/>  })</pre> | <pre>{<br/>  "tags": {}<br/>}</pre> | no |
| <a name="input_elasticsearch_config"></a> [elasticsearch\_config](#input\_elasticsearch\_config) | Configuration for Elasticsearch instance. The attributes 'password', 'kibana\_whitelist' are required. | <pre>object({<br/>    password                         = string<br/>    kibana_whitelist                 = list(string)<br/>    payment_type                     = optional(string, "PayAsYouGo")<br/>    version                          = optional(string, "8.17.0_with_X-Pack")<br/>    zone_count                       = optional(number, 1)<br/>    data_node_disk_type              = optional(string, "cloud_essd")<br/>    data_node_disk_size              = optional(string, "20")<br/>    data_node_amount                 = optional(string, "2")<br/>    data_node_spec                   = optional(string, "elasticsearch.sn1ne.large.new")<br/>    kibana_node_spec                 = optional(string, "elasticsearch.n4.small")<br/>    data_node_disk_performance_level = optional(string, "PL1")<br/>    description                      = optional(string, "elasticsearch-ai-assistant-instance")<br/>  })</pre> | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Configuration for VPC. The attribute 'cidr\_block' is required. | <pre>object({<br/>    cidr_block = string<br/>    vpc_name   = optional(string, "elasticsearch-ai-assistant-vpc")<br/>  })</pre> | <pre>{<br/>  "cidr_block": "192.168.0.0/16",<br/>  "vpc_name": "elasticsearch-ai-assistant-vpc"<br/>}</pre> | no |
| <a name="input_vswitch_config"></a> [vswitch\_config](#input\_vswitch\_config) | Configuration for VSwitch. The attributes 'cidr\_block' and 'zone\_id' are required. | <pre>object({<br/>    cidr_block   = string<br/>    zone_id      = string<br/>    vswitch_name = optional(string, "elasticsearch-ai-assistant-vswitch")<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticsearch_console_url"></a> [elasticsearch\_console\_url](#output\_elasticsearch\_console\_url) | The Elasticsearch instance console URL for management |
| <a name="output_elasticsearch_domain"></a> [elasticsearch\_domain](#output\_elasticsearch\_domain) | The domain of the Elasticsearch instance |
| <a name="output_elasticsearch_instance_id"></a> [elasticsearch\_instance\_id](#output\_elasticsearch\_instance\_id) | The ID of the Elasticsearch instance |
| <a name="output_elasticsearch_kibana_domain"></a> [elasticsearch\_kibana\_domain](#output\_elasticsearch\_kibana\_domain) | The Kibana domain of the Elasticsearch instance |
| <a name="output_elasticsearch_kibana_port"></a> [elasticsearch\_kibana\_port](#output\_elasticsearch\_kibana\_port) | The Kibana port of the Elasticsearch instance |
| <a name="output_elasticsearch_port"></a> [elasticsearch\_port](#output\_elasticsearch\_port) | The port of the Elasticsearch instance |
| <a name="output_elasticsearch_public_domain"></a> [elasticsearch\_public\_domain](#output\_elasticsearch\_public\_domain) | The public domain of the Elasticsearch instance |
| <a name="output_elasticsearch_public_port"></a> [elasticsearch\_public\_port](#output\_elasticsearch\_public\_port) | The public port of the Elasticsearch instance |
| <a name="output_elasticsearch_status"></a> [elasticsearch\_status](#output\_elasticsearch\_status) | The status of the Elasticsearch instance |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vswitch_cidr_block"></a> [vswitch\_cidr\_block](#output\_vswitch\_cidr\_block) | The CIDR block of the VSwitch |
| <a name="output_vswitch_id"></a> [vswitch\_id](#output\_vswitch\_id) | The ID of the VSwitch |
| <a name="output_vswitch_zone_id"></a> [vswitch\_zone\_id](#output\_vswitch\_zone\_id) | The zone ID of the VSwitch |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)