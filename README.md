[![CircleCI](https://circleci.com/gh/sageexplorer/CI-Kubernetes-Microservices.svg?style=svg)](https://circleci.com/gh/sageexplorer/CI-Kubernetes-Microservices)

# This project includes Docker, Kubernetes, CLoudformation, and circleci to build a Microservices App.
# This project uses circleci for CI/CD 
# circleci badge displayed above shows project pass/fail status

* Docker Images are hosted in dockerhub

* When code is changed, circleci builds docker images, runs tests, and starts microservices

* create_eks.sh creates a kubernetes cluser in AWS. 

Rolling Updates:

* Rolling updates can be made by running kubectl apply -f {deployment yml file}, for example: `udacity-c3-deployment/k8s/frontend-deployment.yaml`

* Rolling update is also defined in udacity-c3-deployment/k8s/frontend-deployment.yaml.

`spec:
  replicas: 2
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0`

* To perform rolling update, change the version in deployment to a newer version, like v3m or change the container image.

* To perfrom a rollout, following command was issued, and the site got restored to the previous version. kubectl rollout undo deployment/ngnix

kubernetes Cluster

* Kubernetes cluster is created by cloudformation template on Amazon. The files needed for cluster creation is in cloudformation folder.

To build kubernetes deployment, and service in AWS, run:

* kubectl create -f  frontend-deployment.yaml 
* output `deployment.extensions/frontend created`
* kubectl create -f  frontend-service.yaml 
* output `service/frontend created`
* kubectl create -f backend-user-deployment.yaml 
* output `deployment.extensions/backend-user created`
* kubectl create -f backend-user-service.yaml 
* output `service/backend-user created`
* kubectl create -f backend-feed-deployment.yaml 
* output `deployment.extensions/backend-feed created`
* kubectl create -f backend-feed-service.yaml 
* output `service/backend-feed created`
* kubectl create -f reverseproxy-deployment.yaml 
* output `deployment.extensions/reverseproxy created`
* kubectl create -f reverseproxy-service.yaml 
* output `service/reverseproxy created`

How to update the site?

Push changes to git, it will trigger a build pipeline that runs tests, and lints the source codes. If build passes, docker image is uploaded, and a udagram site is build. When the build step passes, kubernetes can be run on the clusters created by ./create_eks.sh command. 



Cloudwatch Logs are created in the EKS clusster AWS concole. Log details are shown in the screenshots of this project zip file. 

A/B Deployment 

 * A/B tests are performed by deplying different versions of the site at the same time.

 * New Docker image is created

 * New deployemnt yml file is created in the deployment/k8s folder called frontend-canary-deployment.yml

 * Replica set is scaled down to 1

 * The `app: frontend, and track: stable`  are added/changed so that the newer vewrsion has a label

 * Finally, following command is run `kubectl apply -f frontend-canary-deployment.yml'
