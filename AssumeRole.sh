#!/bin/bash

output="assume-role-output.json"

#read -p "Digite o ARN MFA da sua conta: " ARN
read -p "Digite o token: " TOKEN #Vai ler o token e armazenar na variável

aws sts get-session-token --serial-number arn:aws:iam::924357458451:user/alan.patrick --token-code $TOKEN > $output

AccessKeyId=$(cat $output | jq -r '.Credentials''.AccessKeyId')
SecretAccessKey=$(cat $output | jq -r '.Credentials''.SecretAccessKey')
SessionToken=$(cat $output | jq -r '.Credentials''.SessionToken')

export AWS_ACCESS_KEY_ID=$AccessKeyId
export AWS_SECRET_ACCESS_KEY=$SecretAccessKey
export AWS_SESSION_TOKEN=$SessionToken

echo "$AccessKeyId"
echo "$SecretAccessKey"
echo "$SessionToken"

output2="assume-role-output2.json"

read -p "Digite o ID da conta: " AccountID #Vai ler o ID da conta e armazenar na variável
read -p "Digite a Role ( Dati-acc-access / Dati-PowerUserAccess ): " Role #Vai ler a role e armazenar na variável

echo "$AccountID"
aws sts assume-role --role-arn "arn:aws:iam::$AccountID:role/$Role" --role-session-name AWSCLI-Session > $output2
AccessKeyId2=$(cat $output2 | jq -r '.Credentials''.AccessKeyId')
SecretAccessKey2=$(cat $output2 | jq -r '.Credentials''.SecretAccessKey')
SessionToken2=$(cat $output2 | jq -r '.Credentials''.SessionToken')

export AWS_ACCESS_KEY_ID=$AccessKeyId2
export AWS_SECRET_ACCESS_KEY=$SecretAccessKey2
export AWS_SESSION_TOKEN=$SessionToken2

aws s3 ls