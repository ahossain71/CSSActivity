# CSSActivity
This repository contains a Cloud Formation template that deploys a lambda function to the target aws account
The account information is hardcoded in the template as this only an exercise to demo the capability of writing a lambda function and deploy it using a CFN template.

The Contents of this repository are listed below with description of its role in the deployment process

1. Cloud Formation Template 'lambdaResourceCFNTemplate'
This is the Cloudformation template that defines a lambda function as a resource to be deployed.  The IAM role that the lamda function would assume is hard coded into the template.  The lambda function accepts dictionary format payloads when invoked from an api, the values of which is available in the event argument of the function.  This template has already been deployed to the following account and is publicly accessible.  The lambda function named 'listResourcesByTagFilter' is automatically deployed when the CFN template is uploaded to the aws account.

Cloud Formation Template 'lambdaResourceCFNTemplate' location:
https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks?filteringText=&filteringStatus=active&viewNested=true&hideStacks=false

Lambda Function 'listResourcesByTagFilter location:
 https://console.aws.amazon.com/lambda/home?region=us-east-1#/functions

 2. Shell script file 'invokelambda.sh'
 This shell script file contains the command to invoke the 'listResourcesByTag' lambda function which got deployed when the CFN template got uploaded.  The command accepts the following arguments and value or key value
 --function-name "listResourcesByTagFilter"
 --log-type Tail lambdaOutput.txt  
 --payload '{"Server_Group":"DevSecOps"}'

Currently there are two ec2 instances running in this account and they are both tagged with a key value pair of Tag Name ='Server_Group' and Value='DevSecOps'.  When we invoke the lambda function with the payload as {'Server_Group':'DevSecOps'} both the instances would have a tag matching the payload value. The function would then list the instance Ids of these instances and write it to the output file 'lambdaOutput.txt'.

Use instructions:
Download/clone the css activity repository to your local github repository using the following repository address
https://github.com/ahossain71/CSSActivity.git
open your git bash terminal or any other linux terminal and navigate to the local github repository wher you cloned CSSActivity repository
from the command line enter the following shell command and hit enter
sh involelambda.sh
within the smae CSSActivity folder locate the lambdaOutput.txt file and ope it in a text editor
veriify that the text lists the Ids of the instances which has a matching tag as {'Server_Group':'DevSecOps'}
You may add more tag:value pair to the instances, and then modigy the lamda code in the 'lambdaResourceCCFNTemplate.yml' file and upload the template to the aws CloudFormation template library with an update information.
Modify the invokelambda.sh with the new payload values and save it.
From the terminals execute the .sh file again and verify that the lambdaOutput.txt file has the instance Ids list.
