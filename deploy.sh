#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`

echo "Start create vpc."
echo $DATE
aws cloudformation deploy \
--template-file vpc.yaml \
--stack-name vpc
AWS_CF_RETURN=$?
if [[ $AWS_CF_RETURN -ne 0 ]]; then
        echo "[ERROR]CloudFormation create VPC error." >&2
        exit 1
fi
echo "End create vpc."
echo $DATE
echo "---"
echo "Start create security."
echo $DATE
aws cloudformation deploy \
--template-file security.yaml \
--stack-name security
AWS_CF_RETURN=$?
if [[ $AWS_CF_RETURN -ne 0 ]]; then
        echo "[ERROR]CloudFormation create Security error." >&2
        exit 1
fi
echo "End create security."
echo $DATE
echo "---"
echo "Start create web."
echo $DATE
aws cloudformation deploy \
--template-file web.yaml \
--stack-name web
AWS_CF_RETURN=$?
if [[ $AWS_CF_RETURN -ne 0 ]]; then
        echo "[ERROR]CloudFormation create Web error." >&2
        exit 1
fi
echo "End create Web."
echo $DATE
echo "---"
echo "Deploy End."
echo $DATE