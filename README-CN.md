阿里云 Elasticsearch 智能运维 AI 助手 Terraform 模块

# terraform-alicloud-elasticsearch-ai-assistant

[English](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/blob/main/README.md) | 简体中文

Terraform 模块，用于在阿里云上创建 Elasticsearch 智能运维 AI 助手基础设施。该模块实现了[Elasticsearch 智能运维 AI 助手](https://www.aliyun.com/solution/tech-solution/elasticsearch-ai-assistant)解决方案，涉及专有网络（VPC）、交换机（VSwitch）和阿里云 Elasticsearch 实例等资源的创建和部署。该模块为使用 Elasticsearch 和 Kibana 进行智能运维提供了完整的基础设施设置。

## 使用方法

该模块创建完整的 Elasticsearch 智能运维 AI 助手基础设施，包括 VPC、VSwitch 和带有 Kibana 的 Elasticsearch 实例。专为智能运维场景而设计。

```terraform
module "elasticsearch_ai_assistant" {
  source = "alibabacloud-automation/elasticsearch-ai-assistant/alicloud"

  # 通用配置
  common_config = {
    tags = {
      Environment = "production"
      Project     = "ai-assistant"
    }
  }

  # VPC 配置
  vpc_config = {
    cidr_block = "192.168.0.0/16"
    vpc_name   = "my-es-ai-assistant-vpc"
  }

  # VSwitch 配置
  vswitch_config = {
    cidr_block   = "192.168.1.0/24"
    zone_id      = "cn-hangzhou-i"
    vswitch_name = "my-es-ai-assistant-vswitch"
  }

  # Elasticsearch 配置
  elasticsearch_config = {
    password         = "YourSecurePassword123!"
    kibana_whitelist = ["192.168.1.100/32", "10.0.0.0/8"]
  }
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/tree/main/examples/complete)

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

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)