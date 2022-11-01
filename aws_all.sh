#!/bin/bash
for i in {us-east-1,us-east-2,us-west-1,us-west-2,af-south-1,ap-east-1,ap-southeast-3,ap-south-1,ap-northeast-3,ap-northeast-1,ap-northeast-2,ap-southeast-1,ap-southeast-2,ap-southeast-3,eu-central-1,eu-west-1,eu-west-2} 
do 
	aws ec2 describe-instances --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output table --profile obssdevops --region $i     
done
