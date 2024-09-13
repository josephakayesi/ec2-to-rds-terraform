<p align="center" ><img src="https://res.cloudinary.com/tutcan/image/upload/v1726172456/general/ec2-to-rds-cover-art.png" width="100%" height="100%" alt="Design by Joseph Akayesi. Photo by Iker Urteaga"></p>

### Introduction

This guide walks you through setting up and provisioning an Amazon RDS instance in a private subnet and an EC2 instance in a public subnet using Terraform. Both resources will be created within the same VPC, with the appropriate security configurations to allow secure communication between the EC2 instance and the RDS database.

### Infrastructure diagram

<p align="center" ><img src="https://res.cloudinary.com/tutcan/image/upload/v1726243573/general/ec2-to-rds-infrastructure-diagram.webp
" width="100%" height="100%" alt="AWS Infrastructure Diagram by Joseph Akayesi"></p>

### Prerequisites

1. **Terraform Installed**: Ensure that you have Terraform installed on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
2. **AWS CLI Installed and Configured**: Make sure you have the AWS CLI installed and configured with the correct credentials. You can follow [this guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) to set up the AWS CLI.
3. **AWS Account**: You need an AWS account with permissions to create VPCs, subnets, security groups, EC2 instances, RDS instances, IAM roles, and policies.
4. **Text Editor**: Any text editor (like VS Code, Sublime Text, etc.) to modify the Terraform files if needed.

### Step-by-Step Instructions

#### 1. Clone the Repository or Create a Working Directory

If this project is stored in a version control system, clone it to your local machine. Otherwise, create a new directory for the Terraform configuration files.

```bash
git clone <repository_url>
cd <repository_directory>
```

#### 2. Initialize the Terraform Project

Before using Terraform, you need to initialize your working directory, which will download the necessary provider plugins (e.g., AWS).

```bash
terraform init
```

This command will output messages indicating that the initialization was successful and that the necessary plugins were downloaded.

#### 3. Review the Terraform Plan

It's always a good practice to review what changes Terraform will make to your AWS infrastructure before applying them. Use the following command to create an execution plan:

```bash
terraform plan
```

This command will show you all the resources that Terraform will create, modify, or destroy. Review this output carefully to ensure everything looks correct.

#### 4. Apply the Terraform Configuration

To apply the configuration and provision the resources, use the following command:

```bash
terraform apply
```

Terraform will again display the execution plan and ask for confirmation to proceed. Type `yes` and press `Enter` to continue.

#### 5. Wait for the Provisioning to Complete

Terraform will take a few minutes to create all the resources. Once the process is complete, you will see a message indicating that the resources have been successfully created.

#### 6. Verify the Infrastructure

You can verify that the infrastructure has been created by logging into the AWS Management Console and checking the following:

- **VPC**: Ensure that the VPC is created with the correct CIDR block (`10.0.0.0/16`).
- **Subnets**: Check for a public subnet (`10.0.1.0/24`) and a private subnet (`10.0.2.0/24`).
- **EC2 Instance**: Verify that an EC2 instance is running in the public subnet with the appropriate security group and instance profile.
- **RDS Instance**: Verify that an RDS instance is running in the private subnet with the correct security group and subnet group.

### Cleaning Up

To avoid unnecessary charges, you should destroy the resources created by Terraform when you no longer need them.

```bash
terraform destroy
```

This command will prompt for confirmation. Type `yes` and press `Enter` to destroy all resources.

### Common Issues and Troubleshooting

- **DB Subnet Group Error**: If you encounter an error related to `DBSubnetGroupDoesNotCoverEnoughAZs`, ensure that the private subnet spans at least two availability zones.
- **Permissions Errors**: Ensure your AWS credentials have the required permissions to create and manage the specified resources.
- **Terraform Initialization Failures**: Ensure you have a stable internet connection to download provider plugins and that your AWS credentials are correctly configured.

### Conclusion

By following this guide, you have successfully set up an RDS instance in a private subnet and an EC2 instance in a public subnet using Terraform. This setup allows for secure and efficient communication between the EC2 instance and the RDS database within the same VPC.

Feel free to modify and expand the Terraform configuration to suit your specific requirements. Happy provisioning!

### Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs/)
- [AWS RDS Documentation](https://docs.aws.amazon.com/rds/)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
