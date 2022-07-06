locals {
  environment = "demo-dwx-"
  aws_region  = "eu-central-1"
}

resource "random_id" "random" {
  byte_length = 20
}

module "runners" {
  source  = "philips-labs/github-runner/aws"
  version = "1.4.0"

  aws_region                      = local.aws_region
  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets

  prefix = local.environment

  github_app = {
    key_base64     = var.github_app_key_base64
    id             = var.github_app_id
    webhook_secret = random_id.random.hex
  }

  # Grab zip files via lambda_download
  webhook_lambda_zip                = "lambdas-download/webhook.zip"
  runner_binaries_syncer_lambda_zip = "lambdas-download/runner-binaries-syncer.zip"
  runners_lambda_zip                = "lambdas-download/runners.zip"

  enable_organization_runners = true
  runner_extra_labels         = "default,example"

  # enable access to the runners via SSM
  enable_ssm_on_runners = true

  instance_types = ["m5.large", "c5.large"]

  # override delay of events in seconds
  delay_webhook_event   = 5
  runners_maximum_count = 20

  # override scaling down
  scale_down_schedule_expression = "cron(* * * * ? *)"
}

output "runners" {
  value = {
    lambda_syncer_name = module.runners.binaries_syncer.lambda.function_name
  }
}

output "webhook_endpoint" {
  value = module.runners.webhook.endpoint
}
