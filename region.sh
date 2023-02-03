#!/bin/bash

read -p "enter your region:" REGION
if [ -z $REGION ]; then
    echo "please enter valid input"
else
    echo "your region is:$REGION"
fi
aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].VpcId
