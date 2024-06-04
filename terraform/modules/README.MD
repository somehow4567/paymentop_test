## Variables

- `region`: The AWS region to create resources in. (Default: "us-east-1")
- `instance_type`: Type of EC2 instance. (Default: "t2.micro")
- `volume_size`: Size of the EBS volume in GB. (Default: 8)
- `volume_type`: Type of the EBS volume. (Default: "gp2")
- `ami_id`: AMI ID to use for the instance. If not provided, the latest Ubuntu AMI will be used.
- `instance_name`: Name of the EC2 instance.
- `sg_name`: Name of the security group.
- `ingress`: A list of ingress rules for the security group.