---
title : "Khởi tạo Cluster với Fargate "
date :  "`r Sys.Date()`" 
weight : 1
chapter : false
pre : " <b> 3.1.1 </b> "
---
Trong phần này mình sẽ tạo cluster trên **AWS EKS** bằng **eksctl**, một công cụ được tạo ra bởi **weaveworks** để giúp chúng ta tạo cluster trên eks một cách dễ dàng hơn. Đây là **templete** khởi tạo cluster của chúng ta:

```Yaml
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: fargate-cluster
  region: ap-northeast-1

fargateProfiles:
  - name: fp-default
    selectors:
      - namespace: default
      - namespace: kube-system
  - name: fp-dev
    selectors:
      - namespace: app-dev
        labels:
          fargate: 'yes'

```
File configure trên sẽ tạo ra 2 **Fargate Profile**:
-  Một cho namespace **default** và **kube-system** và một cho namespace **app-dev**. Các Objects mặc định của Kubernetes sẽ được chạy trong 2 name space trên. 
-  Profile còn lại sẽ tạo ra namespace **app-dev**, những Pods trong namespace này có label **fargate=yes** sẽ được chạy trên Fargate.

Thực hiện command sau đây để tiến hành tạo cluster với fargate mode:
```
eksctl create cluster -f cluster-fargate.yaml 
``` 
{{% notice info %}}
Bạn có thể thay đổi tên của cluster bằng cách thay đổi giá trị của **metadata.name** trong file **cluster-fargate.yaml**. Bạn cần chờ tầm 15 phút để cluster được tạo xong.
{{% /notice %}}
Hãy xem lại thông tin **Profile Fargate** đã được tạo
```
aws eks describe-fargate-profile \
    --cluster-name fargate-cluster \
    --fargate-profile-name fp-dev
```
Dưới đây là ví dụ về một **Fargate Profile** được tạo ra:
```
{
    "fargateProfile": {
        "fargateProfileName": "fp-dev",
        "fargateProfileArn": "arn:aws:eks:ap-southeast-1:708218810093:fargateprofile/fargate-cluster/fp-dev/9ec54cc9-af60-1cf0-fd21-86ebfc54596f",
        "clusterName": "fargate-cluster",
        "createdAt": "2023-09-15T16:01:29.537000+00:00",
        "podExecutionRoleArn": "arn:aws:iam::708218810093:role/eksctl-fargate-cluster-clu-FargatePodExecutionRole-18IHJGASIOB24",
        "subnets": [
            "subnet-08a83dabf207d2fac",
            "subnet-06c074e2e6bead05e",
            "subnet-087aa09ccfd79c18b"
        ],
        "selectors": [
            {
                "namespace": "app-dev",
                "labels": {
                    "fargate": "yes"
                }
            }
        ],
        "status": "ACTIVE",
        "tags": {}
    }
}
```
Bạn đã hoàn thành tào một cluster trên EKS bước tiếp theo chúng ta sẽ cài đặt **AWS Load Balancer Controller** để có thể sử dụng được **Load Balancer** trên Fargate.