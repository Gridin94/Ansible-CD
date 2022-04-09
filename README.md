## Week 7 Project

# CI/CD with Azure DevOps

__Configure CI/CD pipelines to deploy the Node Weight Tracker application for 2 environments: Staging and Production.__

__In this project I have used everything we've learned so far and previous projects.__

## Prerequisites for the project

- __IaC with Terraform- Provisioning of two identical environments : Week 6 project.__

- __Configuration Management with Ansible - Installing all the dependencies and deploying the application for the first time on the remote machines: Week 6 Ansible project.__ 

- __Node Weight Tracker - The Bootcamp application which you can find [here](https://github.com/Gridin94/bootcamp-app) .__

Project environment:
![week-7-envs](https://camo.githubusercontent.com/5b41c84bd41e6a41560415440ee422765f39c0cafd7c2e755ee429d8fabb0a70/68747470733a2f2f626f6f7463616d702e7268696e6f70732e696f2f696d616765732f7765656b2d362d656e76732e706e67)




__Before using this project the following files should be edited:__

**inventories**
- **production**
  - hosts &emsp;&emsp;&emsp;__*# production nodes ip's*__

- **staging**

  - hosts &emsp;&emsp;&emsp;__*# staging nodes ip's*__

**group_vars:**

- all.yml


__Read documentation in source files.__
#
## Continuous Integration
The YAML `ci.yml` responsible for the CI pipeline.

__steps:__

1. Install npm in the source directory.

1. Copy the files to the artifacts directory.

1. Publish it to Azure DevOps artifacts.

## Continuous Deployment and Continuous Delivery
For the CI/CD I've created a pipeline which using Ansible to deploy the artifacts to the environments.

>*The whole process of deployment to the Staging environment is completely automated while deployment process to the Production environment arequires an approval*

For convenience, I've imported this repository to Azure Repos and used it in the pipeline as an artifact which allows me to run this Ansible playbook on any machine(On which Asible is installed).

**The CD pipline in Azure DevOps:**




As you can see, once a new artifact added to Azure DevOps Artifacts it triggers the CD to the Staging enviroment.

**Stages Configuration:**

The Staging deployment stage is fully automatic and is triggered when there is a new artifact of Bootcamp Application.(link below)


__example:__





The Production deployment stage is activated when a user with permissions approves the deployment after a successful deployment in the Staging environment.





>Note: Ive linked to each pipeline(stage and prod) a variable groups from the library and passing them in the command line as extra vars and using them to fill the .env file variables.
some of them contain sensitive information and are therefore not exposed to all.
