#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`
STACKS=(vpc security web)

for stack in ${STACKS[@]}
do
        echo "Start create ${stack} |" `date '+%Y-%m-%d %H:%M:%S'`
        aws cloudformation deploy \
        --template-file ${stack}.yaml \
        --stack-name ${stack}
        if [[ $AWS_CF_RETURN -ne 0 ]]; then
                echo "[ERROR]CloudFormation create ${stack} error." >&2
                exit 1
        fi
        echo "End create ${stack} |" `date '+%Y-%m-%d %H:%M:%S'`
        echo "---"
done
echo "Deploy End |" `date '+%Y-%m-%d %H:%M:%S'`