#!/bin/bash
aws lambda invoke --function-name "listResourcesByTagFilter" --log-type Tail lambdaOutput.txt  --payload '{"Server_Group":"DevSecOps"}'
read -p 'Press enter key to continue ...'
