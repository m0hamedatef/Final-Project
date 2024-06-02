# Cloud-Native-App-Pipeline# NTI-Final
1- Terraform:
-create EKS Cluster consists of two nodes with auto scaling group and ELB

-create RDS instance

-create EC2 for running Jenkins

-make daily snapshot of jenkins instace using aws backup service

-save ELB access log to AWS S3 Bucket

-create AWS ECR 

2- Ansible:
-install jenkins including configuration and plugin installations

-install cloud-watch agent on all ec2 in your project

3-Docker:

-make docker images for the code

-create docker compose to run app completely in local

4-Kubernates:

-create kubernates manifests to apply it into AWS EKS cluster

-make network policy to ensure security best practice between pods

5-Jenkins:

-create multi-branch pipeline to make build on every push on dev,test,prod github branches

-pipeline stages:

-build dockerfile in the repo

-push it to ECR

-deploy new image to kubernates pods

 6-monitoring:
 -create AWS cloud watch dashboard to k8s cluster 
