### Contents

| Folder | Description  |
|------------|---------|
| EC2 |  Launch a simple AWS EC2 instance inside a public subnet |
| VPC-Subnet | AWS VPC with Private and Public Subnets via Terraform |


### Terraform
#### `tfvars` File

This file is used to provide values to variables.  
Alternatively, either use default values or provide the values during infrastructure provision

Terraform also automatically loads variable definitions files if:
- the files are named exactly `terraform.tfvars` or `terraform.tfvars.json`
- the file name ends in `.auto.tfvars` or `.auto.tfvars.json`

If the file name is say, variables.tfvars, specify that file in command line `terraform apply -var-file="variables.tfvars"`

### Cheat sheet

| Command | Description  |
|------------|---------|
| `terraform init` | initiate terraform, install provider |
| `terraform fmt --recursive` | format code, `--recursive` for also any files inside sub-folders |
| `terraform validate` | validate code |
| `terraform plan` | plan before provisining infrastructure |
| `terraform apply` | provision infrastructure |
| `terraform destroy` | nuke infrastructure |
| `terraform output` | list all outputs |

Use `--auto-approve` option with `apply` and `destroy` to skip confirmation message