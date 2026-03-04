# Complete Example for terraform-alicloud-elasticsearch-ai-assistant

This example demonstrates the complete usage of the elasticsearch-ai-assistant module. It creates a full Elasticsearch AI Assistant infrastructure including VPC, VSwitch, and Elasticsearch instance.

## Features

- Creates a VPC with configurable CIDR block
- Creates a VSwitch in the specified availability zone
- Deploys an Elasticsearch instance with Kibana
- Automatically configures Kibana whitelist with current public IP
- Supports customizable Elasticsearch configuration

## Usage

1. **Set required variables**

   Create a `terraform.tfvars` file with the following content:

   ```hcl
   elasticsearch_password = "YourSecurePassword123!"
   region                 = "cn-hangzhou"
   name_prefix           = "my-elasticsearch"
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Plan the deployment**

   ```bash
   terraform plan
   ```

4. **Apply the configuration**

   ```bash
   terraform apply
   ```

5. **Access Kibana**

   After deployment, use the `kibana_access_url` output to access the Kibana interface.

## Required Variables

- `elasticsearch_password`: Password for the Elasticsearch instance (must be 8-30 characters and contain at least three types: uppercase letters, lowercase letters, numbers, and special characters)

## Optional Variables

- `region`: Alibaba Cloud region (default: `cn-hangzhou`)
- `name_prefix`: Prefix for resource naming (default: `es-ai-assistant-example`)
- `vpc_cidr_block`: VPC CIDR block (default: `192.168.0.0/16`)
- `vswitch_cidr_block`: VSwitch CIDR block (default: `192.168.1.0/24`)
- `availability_zone`: Availability zone for VSwitch (default: first available zone)
- `kibana_whitelist`: IP addresses allowed to access Kibana (default: current public IP)
- `elasticsearch_version`: Elasticsearch version (default: `8.17.0_with_X-Pack`)
- `data_node_amount`: Number of data nodes (default: `2`)
- `data_node_spec`: Data node specification (default: `elasticsearch.sn1ne.large.new`)
- `kibana_node_spec`: Kibana node specification (default: `elasticsearch.n4.small`)

## Outputs

- `elasticsearch_instance_id`: ID of the Elasticsearch instance
- `elasticsearch_domain`: Domain of the Elasticsearch instance
- `kibana_domain`: Kibana domain for web access
- `kibana_access_url`: Complete Kibana access URL
- `elasticsearch_access_url`: Complete Elasticsearch access URL
- `elasticsearch_console_url`: Elasticsearch console URL for management
- `vpc_id`: ID of the created VPC
- `vswitch_id`: ID of the created VSwitch

## Security Notes

- The Elasticsearch password is marked as sensitive and will not be displayed in logs
- Kibana access is restricted to the specified whitelist IPs
- By default, the current public IP is automatically added to the Kibana whitelist

## Cost Estimation

**Warning:** Running this example will create real resources in your Alibaba Cloud account that will incur costs. The main cost components include:

- Elasticsearch instance (Pay-As-You-Go or Subscription)
- Data storage (cloud_essd disks)
- Network bandwidth
- Kibana node

Please review the [Elasticsearch pricing](https://www.alibabacloud.com/product/elasticsearch/pricing) before deploying this example.

## Clean Up

To destroy the created resources:

```bash
terraform destroy
```

## Network Configuration

The example creates:
- A VPC with CIDR `192.168.0.0/16` (configurable)
- A VSwitch with CIDR `192.168.1.0/24` (configurable)
- Elasticsearch instance deployed in the VSwitch

Make sure the VSwitch CIDR is a subset of the VPC CIDR block.