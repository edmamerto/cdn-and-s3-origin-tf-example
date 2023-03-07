# CDN and S3 Origin Terraform Example

You can use this project as a reference for Cloudfront and S3 origin boilerplate

## Architecture
![arch](arch.png)


## AWS config

This project is configured to find aws credentials based on the profile you set it

Example on `dev.tfvars`
```
aws_profile = "dev-ed"
```

*See [AWS cli configuration basics](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)*


## Develop
Initialize terraform
```
$ terraform init
```
Verify desired state in `dev`
```
$ terraform plan -var-file="dev.tfvars"
```

## Deploy
```
$ terraform apply -var-file="dev.tfvars"
```
