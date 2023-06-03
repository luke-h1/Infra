#!/bin/bash


# Create AWS IAM User with administrative privileges for aws-nuke
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
aws iam create-user --user-name aws-nuke
aws iam create-access-key --user-name aws-nuke

aws iam attach-user-policy --policy-arn arn:aws:iam:$ACCOUNTID:aws:policy/AdministratorAccess --user-name aws-nuke




# Configure the AWS CLI profile for AWS Nuke
aws configure — profile aws_nuke
# Enter your IAM ACCESS_KEY
# Enter your IAM SECRET_KEY
# Enter a default region E.g. us-east-1
# Enter an output format E.g. json

# Configure AWS credential
cat .aws/credentials
cat .aws/config
aws sts get-caller-identity — profile aws_nuke

# Create an account alias name for your AWS account
aws iam create-account-alias — profile aws_nuke — account-alias luke-aws-account


aws-nuke -c nue-config.yml --profile aws_nuke --no-dry-run