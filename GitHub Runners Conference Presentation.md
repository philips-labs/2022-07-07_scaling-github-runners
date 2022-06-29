# GitHub Runners Conference Presentation


TODO
Intro philips

- we are from philips, you think about this...
- bit of fun, ask Jeroen?
- HealthTech -> Software -> Open Source


Key things
- severless / event scaling / leverage cloud native ideas for build architecture get rid of under the desk culture
- open source we are a software com
- 

Challenges
- ?


---


1 hours slot
plan for 50 mins + Q&A

- Explain the problem
  - GitHub Cloud runners? Private network?
  - Custom VMS/Config
  - Different approaches available (K8s vs VMs)
  - Why did we not use k8s?

Solution

- Low cost and highly scalable using built in AWS services (lambda/sqs)
- GitHub Enterprise
- AWS GovCloud
- Connectivity to private networks
- Promoted by GH as a solution for self-hosted runners
- Flexibility for OS and config (windows/macos arm/gpu)
- Ephemeral runners for security
- Terraform
- Release automation
- Started with Linux and had the flexibility to include Windows

- How we use it in Philips
  - Scale
  - Numbers
  - Costs
  - Savings
  - etc

Demo???

- what do we want to demo?

  - Deploy from scratch (fake it?)?
  - Show scaling
  - Ephemeral

- Open Source
  - Building community
  - High quality
  - We are our own consumers
  - People who use it (DowJones, xyz)
    - Contributors - How many contributors do we have?
