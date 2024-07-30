#!/bin/bash
export AWS_PROFILE=me
AWS_ACCOUNT_ID=674263957758
AWS_REGION=us-east-1
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com