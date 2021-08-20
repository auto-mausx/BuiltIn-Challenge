# BuiltIn-Challenge

> This demo is as lightweight as I could think to make a blue to green type deployment with no downtime in the alotted 3 hour time box.

## Setup

- Fork and Clone this repo to your github account

- This demo assumes you have an admin IAM user in place as well as a default VPC

- This demo also assumes you have your AWS keys stored in `~/.aws/credentials` (Linux/OSx)

- Navigate to the `local.tf` file and paste your current VPC id into the `vpc_defaults` section as well as the `use_default_vpc` section

- If you would like, navigate to the `terraform.tfvars` file and enter your prefered docker container

- First, change directories into the `/terraform` folder, and run `terraform plan`, to confirm resources being made

- After the plan has been sucessfully built, run `terraform apply` to build the resources

- After the resources have been sucessfully built, you need to manually configure the github workflow secrets by running the following commands:

  ```BASH
    $ gh secret set AWS_ACCESS_KEY_ID -b $(terraform output -raw publisher_access_key)

    $ gh secret set AWS_SECRET_ACCESS_KEY -b $(terraform output -raw publisher_secret_key)

    $ gh secret set AWS_REGION -b $(terraform output -raw aws_region)

    $ gh secret set ECR_REPOSITORY_NAME -b $(terraform output -raw ecr_repository_name)

    $ gh secret set ECS_CLUSTER -b $(terraform output -raw ecs_cluster)

    $ gh secret set ECS_SERVICE -b $(terraform output -raw ecs_service)
  ```

  - Essentially, what this does is point the github workflow to the IAM role and ECS cluster that was created by terraform in order to run the workflow and apply the new application revision

    *Note: You must tag each new revision before pushing to github, as well as remember to push with the --tag flag in order for the deployment to trigger*

  - Make a revision to the code in `app.py` and push your newly tagged revision to github

  - If you visit the URL provided by the terraform output, both before and after the tagged push to github, the app should change to the python simple app.

  - You can view the entire workflow if you go to the actions tab under your cloned repository
