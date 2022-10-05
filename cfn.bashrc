#!/bin/sh

# create a CFN stack, or update it if it exists
deploy() {
    aws cloudformation deploy --stack-name "$1"                \
        --template-body "file://$2" --parameters "file://$3"   \
        --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
        --region=us-east-1
}

# create CFN stacks
create() {
    aws cloudformation create-stack --stack-name "$1"          \
        --template-body "file://$2" --parameters "file://$3"   \
        --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
        --region=us-east-1
}

# update already present CFN stacks
update() {
    aws cloudformation update-stack --stack-name "$1"          \
        --template-body "file://$2"  --parameters "file://$3"  \
        --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
        --region=us-east-2
}

# validate the syntax of yml and json CFN files
verify() {
    aws cloudformation validate-template --template-body "file://$1"
}