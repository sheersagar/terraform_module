# Terraform Infrastructure as Code

## Overview

This project utilizes Terraform to provision and manage cloud infrastructure. The architecture is designed to promote modularity and reusability by using Terraform modules. Each module encapsulates specific functionality, making it easier to manage and maintain the infrastructure code.

## Project Structure

The project follows a well-organized directory structure:

```
.
├── main.tf                   # Main configuration file to provision resources
├── modules                   # Directory containing all reusable modules
│   ├── igw                   # Internet Gateway module
│   │   ├── main.tf           # Resources for the Internet Gateway
│   │   ├── output.tf         # Outputs for the Internet Gateway
│   │   ├── terraform.tfvars   # Variables specific to the IGW module
│   │   └── variable.tf       # Variable definitions for the IGW module
│   ├── nat                   # NAT Gateway module
│   │   ├── main.tf           # Resources for the NAT Gateway
│   │   ├── output.tf         # Outputs for the NAT Gateway
│   │   ├── terraform.tfvars   # Variables specific to the NAT module
│   │   └── variable.tf       # Variable definitions for the NAT module
│   ├── routeTable            # Route Table module
│   │   ├── main.tf           # Resources for the Route Table
│   │   ├── output.tf         # Outputs for the Route Table
│   │   ├── terraform.tfvars   # Variables specific to the Route Table module
│   │   └── variable.tf       # Variable definitions for the Route Table module
│   ├── securityGroup         # Security Group module
│   │   ├── main.tf           # Resources for the Security Group
│   │   ├── output.tf         # Outputs for the Security Group
│   │   ├── terraform.tfvars   # Variables specific to the Security Group module
│   │   └── variable.tf       # Variable definitions for the Security Group module
│   ├── subnets               # Subnet module
│   │   ├── main.tf           # Resources for Subnets
│   │   ├── output.tf         # Outputs for Subnets
│   │   ├── terraform.tfvars   # Variables specific to the Subnets module
│   │   └── variable.tf       # Variable definitions for the Subnets module
│   └── vpc                   # VPC module
│       ├── main.tf           # Resources for the VPC
│       ├── output.tf         # Outputs for the VPC
│       ├── terraform.tfvars   # Variables specific to the VPC module
│       └── variable.tf       # Variable definitions for the VPC module
├── output.tf                 # Global output values
├── terraform.tfstate         # Terraform state file (not to be shared publicly)
├── terraform.tfstate.backup  # Backup of the Terraform state file
├── terraform.tfvars          # Global variables definition file
└── variable.tf               # Global variable definitions
```

## Significance of Modules

Modules in Terraform are a way to group related resources and encapsulate their configuration. This approach offers several benefits:

- **Reusability**: Modules can be reused across different projects or environments, reducing duplication and ensuring consistency.
- **Organization**: By separating infrastructure components into modules, the code becomes easier to navigate and understand.
- **Abstraction**: Modules allow for hiding the complexity of resource definitions, making it easier to work with high-level configurations.

Each module in this project serves a specific purpose, such as managing networking components (like subnets and route tables), security settings, or gateways, allowing for a clean and manageable codebase.

## Usage of `terraform.tfvars`

The `terraform.tfvars` files in each module provide default values for the variables defined in `variable.tf`. This is particularly useful for keeping sensitive or environment-specific information out of the main configuration files. Here’s a basic example of how to structure a `terraform.tfvars` file:

```hcl
# Example terraform.tfvars for the VPC module
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "my-vpc"
```

**Warning**: Never commit `terraform.tfstate` files or any sensitive information to public repositories. The `terraform.tfstate` file contains critical information about the infrastructure, including resource IDs and sensitive data. Always use `.gitignore` to exclude these files from version control.

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan your infrastructure:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Conclusion

This Terraform project provides a robust framework for managing cloud infrastructure using best practices such as modular design and variable management. By following this structure, you can easily adapt and extend your infrastructure as needed while maintaining clarity and organization in your code.