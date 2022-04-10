// 1. create a provide for AWS
provider "aws" {
  region  = var.region
  profile = var.profile

  // pathexpand converts "~" to /home/user, i.e. $HOME
  shared_credentials_file = pathexpand(var.credentials_file)
}