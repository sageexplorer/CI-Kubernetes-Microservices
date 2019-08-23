[![CircleCI](https://circleci.com/gh/sageexplorer/CI-Kubernetes-Microservices.svg?style=svg)](https://circleci.com/gh/sageexplorer/CI-Kubernetes-Microservices)

# This project includes Docker, Kubernetes, CLoudformation, and circleci to build a Microservices App.
# This project uses circleci for CI/CD 

* Docker Images are hosted in dockerhub

* When code is changed, circleci builds docker images, runs tests, and starts microservices

* create_eks.sh creates a kubernetes cluser in AWS. 

Rolling Updates:

Rolling updates can be made by running kubectl apply -f kubernetes/deployment.yml

Rolling update is defined in kubernetes/deployment.yml

To perform rolling update, change the version in deployment to a newer version, like v3m or change the container image.

To perfrom a rollout, following command was issued, and the site got restored to the previous version. kubectl rollout undo deployment/ngnix

kubernetes Cluster

Kubernetes cluster is created by cloudformation template on Amazon. The files needed for cluster creation is in cloudformation folder.

To build kubernetes deployment, and service in AWS, run:

kubectl create -f  frontend-deployment.yaml 
output `deployment.extensions/frontend created`
kubectl create -f  frontend-service.yaml 
output `service/frontend created`
kubectl create -f backend-user-deployment.yaml 
output `deployment.extensions/backend-user created`
kubectl create -f backend-user-service.yaml 
output `service/backend-user created`
kubectl create -f backend-feed-deployment.yaml 
output `deployment.extensions/backend-feed created`
kubectl create -f backend-feed-service.yaml 
output `service/backend-feed created`
kubectl create -f reverseproxy-deployment.yaml 
output `deployment.extensions/reverseproxy created`
kubectl create -f reverseproxy-service.yaml 
output `service/reverseproxy created`

How to update the site?

Push changes to git, it will trigger a build pipeline that runs tests, and lints the source codes. If build passes, docker image is uploaded, and a ngnix site is build. When the build step passes, kubernetes can be run on the clusters created by cloudformation command. Note: at this point, kubectl is run locally, but this could also be part of the build pipeline

