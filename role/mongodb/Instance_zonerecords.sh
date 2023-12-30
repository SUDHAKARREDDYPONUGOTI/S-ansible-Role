#!/bin/bash

AMI_ID=ami-03265a0778a880afb

SG_ID=sg-04038fe44aadc4c89
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
HOSTER_ZONE_ID=Z04739421AO6YEL959JDA
INSTANCE_TYPE=t2.micro
DOMAIN_NAME=devopslearnhub.online

for i in "${INSTANCES}[@]"
do 
    if [ $i = "mongodb"] || [ $i = "mysql"] || [ $i = "shipping"]
    then
        $INSTANCE_TYPE=t3.micro
    else
        $INSTANCE_TYPE=t3.micro
    fi
    
    aws ec2 run-instances --image-id $AMI_ID --instance-type $INSTANCE_TYPE --security-group-ids $SG_ID
done 

