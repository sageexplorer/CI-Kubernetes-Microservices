eksctl create cluster \
--region us-east-2
--profile udacity \
--name microservices \
--version 1.13 \
--nodegroup-name standard-workers \
--node-type t2.nano \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--node-ami auto