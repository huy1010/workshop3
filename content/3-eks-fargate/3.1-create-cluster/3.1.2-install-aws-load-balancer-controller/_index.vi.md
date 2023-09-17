---
title : "Cài đặt AWS Load Balancer Controller"
date :  "`r Sys.Date()`" 
weight : 2
chapter : false
pre : " <b> 3.1.2 </b> "
---
Để cài đặt **AWS Load Balancer Controller**, chúng ta tiến hành các bước sau đây:

1. Cho phép cluster sử dụng dịch vụ **AWS Identity and Access Management (IAM)** để quản lý các tài nguyên AWS. 
    ```
    eksctl utils associate-iam-oidc-provider --cluster <YOUR_CLUSTER_NAME> --approve
    ```
2. Tạo **IAM Policy** cho **AWS Load Balancer Controller**
    ```
    aws iam create-policy \
      --policy-name AWSLoadBalancerControllerIAMPolicy \
      --policy-document file://iam_policy.json
    ```
3. Tạo **IAM Service account** cho **AWS Load Balancer Controller**, thay thế ``<YOUR_CLUSTER_NAME>`` và ``<AWS_ACCOUNT_ID>`` trong command dưới đây và chạy nó để tạo service account.
    ```
    eksctl create iamserviceaccount \
      --cluster=<YOUR_CLUSTER_NAME> \
      --namespace=kube-system \
      --name=aws-load-balancer-controller \
      --attach-policy-arn=arn:aws:iam::<AWS_ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
      --override-existing-serviceaccounts \
      --approve
    ```
    kiểm tra lại service account đã được tạo bằng command sau đây
    ```
    kubectl get serviceaccount aws-load-balancer-controller --namespace kube-system
    ```
4. Cài đặt AWS Load Balancer Controller
    ```
    helm repo add eks https://aws.github.io/eks-charts
    kubectl apply -k https://raw.githubusercontent.com/aws/eks-charts/master/stable/aws-load-balancer-controller/crds/crds.yaml
    ```
    Thay thế các giá trị ```<YOUR_CLUSTER_NAME>```, ```<YOUR_REGION_CODE>```, ```<VPC_ID>``` trong command dưới đây và chạy nó để cài đặt AWS Load Balancer Controller. VPC_ID là ID của VPC mà cluster của bạn đang sử dụng.
    ```
    helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
        --set clusterName=<YOUR_CLUSTER_NAME> \
        --set serviceAccount.create=false \
        --set region=<YOUR_REGION_CODE> \
        --set vpcId=<VPC_ID> \
        --set serviceAccount.name=aws-load-balancer-controller \
        -n kube-system
    ```
{{% notice tip %}}
Chúng ta vừa hoàn thành việc cài đặt AWS Load Balancer Controller trên cluster. Giúp liên kiết dịch vụ ELB của aws với cluster của chúng ta. Bạn có thể đọc thêm về AWS Load Balancer Controller tại [đây](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html). 
{{% /notice %}}
