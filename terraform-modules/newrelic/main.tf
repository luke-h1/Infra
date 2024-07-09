terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.39.1"
    }
  }

  backend "s3" {
    bucket = "nr-lho-tf-state"
    key    = "vpc/live.tfstate"
  }
}


module "newrelic-aws-cloud-integrations" {
  source = "github.com/newrelic/terraform-provider-newrelic//examples/modules/cloud-integrations/aws"

  newrelic_account_id     = var.account_id
  newrelic_account_region = "EU"
  name                    = "production"
}


provider "newrelic" {
  account_id = var.account_id
  api_key    = var.api_key
  region     = "EU"
}
