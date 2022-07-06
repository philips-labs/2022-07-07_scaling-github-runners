# Demo

Demo setup for showing scaling of the the runners. Setup is based on the [default example](https://github.com/philips-labs/terraform-aws-github-runner/tree/develop/examples/default).

1. Follown the setup as described in the [REAMDE of the OS module](https://github.com/philips-labs/terraform-aws-github-runner#setup-github-app-part-1).
2. Create the cloud resources, `cd terraform && terraform init && terraform apply`
3. Complete the setup by configure the webhook and the secret.
4. Create a demo repo and install the created GitHub app to the repo.
5. Add the [workflow](./workflows/cowsay.yml) to the repo to test the runners.
