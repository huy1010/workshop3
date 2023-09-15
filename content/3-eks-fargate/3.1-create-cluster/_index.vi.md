---
title : "Khởi tạo Cluster"
date :  "`r Sys.Date()`" 
weight : 1
chapter : false
pre : " <b> 3.1 </b> "
---
Trong phần này mình sẽ tạo cluster trên AWS EKS bằng eksctl, một công cụ được tạo ra bởi weaveworks để giúp chúng ta tạo cluster trên eks một cách dễ dàng hơn. Đây là templete khởi tạo cluster của chúng ta:
```yml
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
File configure trên sẽ tạo ra 2 Fargate Profile:
-  Một cho namespace default và kube-system và một cho namespace app-dev. Các Objects mặc định của Kubernetes sẽ được chạy trong 2 name space trên. 
-  Profile còn lại sẽ tạo ra namespace app-dev, những Pods trong namespace này có label fargate=yes sẽ được chạy trên Fargate.
THực hiện command sau đây để tiến hành tạo cluster với fargate mode:
```
eksctl create cluster -f cluster-fargate.yaml 
``` 
{{% notice info %}}
Bạn có thể thay đổi tên của cluster bằng cách thay đổi giá trị của metadata.name trong file cluster.yaml. Bạn cần chờ vài phút để cluster được tạo xong. Bạn có thể theo dõi quá trình tạo cluster bằng cách chạy command sau:
```eksctl get cluster```
{{% /notice %}}
Hãy xem lại thông tin Profile Fargate đã được tạo
```
aws eks describe-fargate-profile \
    --cluster-name fargate-cluster \
    --fargate-profile-name fp-dev \   
```
