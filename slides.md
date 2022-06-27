---
marp: true
author: Niek Palm & Scott Guymer
backgroundColor: black
color: blue
class:
  - invert
  - lead

theme:
---

<!-- Global style -->
<style>
section {
  font-size: 32px;
}

</style>

![bg](assets/infra-as-code.jpg)
<br>
<br>
<br>

## <!--fit--> **GitHub runners for a few cents**

#### **Scott Guymer / Niek Palm**

---

# Niek Palm

- Philips | Principal Engineer

- Hands-on | Open Source

- AWS | IaC | TypeScript

- Travel | Home Cook | Triathlon

![bg right:50%](assets/niek-japan.jpeg)

---

# Scott Guymer

- Philips | Principal Engineer

- Hands-on | Open Source

- AWS | Azure | C# | TypeScript

- Ice Hockey

![bg right:50%](assets/scott.jpg)

---

## <!--fit--> A brief history

🏛️ March 2020

👨🏽‍💻 InnerSource the new Default

✨ Source Code -> GitHub

🔌 Empower everyone with Actions

![bg right](assets/iron-age.jpg)

---

# 101 - InnerSource

InnerSource is a development methodology where engineers build proprietary software using best practices from large-scale open source projects.

![50% bg right](assets/innersource.png)

---

# 101 - GitHub Actions

- Actions == GitHub CI/CD ++
- Actions == CI/CD Lego bricks
- Jobs are triggered by an event
- Jobs require a runner to run

```yaml
on: [push]
jobs:
  check-bats-version:
    runs-on: [self-hosted]
    container: node:16
    steps:
      - uses: actions/checkout@v3
      - run: npx bats -v
```

![bg right](assets/overview-actions-design.png)

---

# <!-- fit --> 🏗️ What do we need for CI/CD?

---

# <!-- fit --> 🔌 Connection

![bg right](assets/cables.jpg)

---

# <!-- fit --> ↔️ Scale

![bg right](assets/scale.jpeg)

---

# <!-- fit --> 💰 Costs

![bg right](assets/money.jpeg)

---

# <!-- fit --> 🪴 Sustainable

![bg right](assets/eco.jpeg)

---

<!-- markdownlint-disable MD033 -->
<style scoped>

h1 {
  font-size: 80px
}

section {
  font-size: 28px;
}

</style>

# 💡 Idea

* Run on standard Linux VMs
* Scale in/ou based on workload
* Run in cloud connected to premise
* Support repo and org level runners
* Develop open source from day zero
* Apply all standard practices

![90% bg right](assets/idea.png)

---

<!-- <style scoped>

h1 {
  color: green;
  font-size: 90px;
  font-family: fantasy;
  text-align: center;
}

h2 {
  color: blue;
  font-size: 50px;
  text-align: center;
  font-family: fantasy;
}

</style>

## Pay only for usage

## Scaling to zero

# SERVERLESS

## Event based

## Treat runners as cattle -->


---

# <!-- fit --> 🤔 Scale up?

<br><br>

💡 Listen for workflow job event

💡 Scale potential for any event

💡 Condition to prevent scaling

![bg right](assets/cars.jpeg)

---

# <!-- fit --> 🤔 Scale down?

<br><br>

⚠️ No event

⚠️ No queue, or API to check

💡 Scheduled task

![bg right](assets/zero.jpeg)

---

# <!-- fit --> 🤔 Costs & Sustaible?

<br><br>

💡 Serverless

💡 Scale down when possible

💡 Low cost on maintenance

💡 Treat runners as a cattle

![bg right](assets/zero.jpeg)

---

<style scoped>
section {
  font-size: 28px;
}
</style>

## Cloud Architecture

* GitHub App for events
* AWS API gateway to get events
* AWS Lambda for event handling
* AWS SQS for decoupling
* AWS Lambda to scale up
* GitHub App for API access
* AWS EC2 (Spot) to run jobs
* AWS Direct connect for networking
* AWS Lambda for scaling down

![bg right](assets/architecture.jpg)

---

# <!-- fit --> 📢 LIVE DEMO

![bg right](assets/building.jpeg)

---

# Security

* Ephemeral
* Encrypted secrets
* Minimal privilleges
* Permission boundaries


![bg right](assets/vault.jpeg)


---

# Open Source

⭐ 900+ stars

✨ 75+ contributors

❤️ 330+ Pull requests

🏆 Recommended by GitHub


![bg right](assets/runners-os.png)

---

# Contribution

* Support windows
* Support ARM
* Better docs
* More Secure
* Upgrades

![bg right](assets/lego.jpeg)

---

# OS

topics we could cover

- PR checks automated
- Auomated release
- Slack
- Build a community


---

# Usage in Philips

---

# How we deploy

<!--
- pipelines
- terraform / terragrunt
- checks
- codeowners for security officer..
-->

---

```hcl

module "github-runner" {
  source  = "philips-labs/github-runner/aws"

  aws_region  = "eu-west-1"
  vpc_id     = "vpc-123"
  subnet_ids = ["subnet-123", "subnet-456"]

  github_app = {
    key_base64     = "secret"
    id             = "1"
    webhook_secret = "webhook_secret"
  }

  enable_organization_runners = true
}
```
