#cred
provider "aws" {
  shared_credentials_files = var.cred
  profile = var.profile
  region = var.region
}