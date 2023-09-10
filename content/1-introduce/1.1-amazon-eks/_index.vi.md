---
title : "Amazon EKS"
date :  "`r Sys.Date()`" 
weight : 1 
chapter : false
pre : " <b> 1.1 </b> "
---
### Amazon Elastic Kubernetes Service (EKS)
**Amazon Elastic Kubernetes Service (EKS)** là một dịch vụ cho phép người dùng vận hành Kubernetes trên AWS một cách dễ dàng. Nó cung cấp các tính năng như tự động triển khai, quản lý, và mở rộng các ứng dụng container sử dụng Kubernetes. Ngoài ra EKS còn được kết nối với các dịch vụ khác như CloudWatch, Auto Scaling Group, Load Balancer, IAM, VPC, và các dịch vụ khác của AWS. 
### Các tính năng chính của EKS
#### Secure networking and authentication
EKS khởi chạy cluster của bạn trong AWS networking và sử dụng IAM để xác thực và quản lý quyền truy cập vào cluster của bạn.
Việc này sẽ tăng tính bảo mật cho các workload của bạn khi chạy trên EKS.
#### Highly available and scalable
EKS sử dụng các master node được triển khai trên nhiều Availability Zone (AZ) để đảm bảo tính sẵn sàng cao và khả năng mở rộng. Ngoài ra, EKS còn hỗ trợ các tính năng như Auto Scaling Group, Elastic Load Balancing, và Elastic Block Store để đảm bảo tính sẵn sàng và khả năng mở rộng cho các ứng dụng của bạn.
#### Managed Kubernetes experience
Bạn có thể quản lý cluster của mình bằng nhiều công cụ khác nhau như eksctl, AWS management console, AWS CLI, và các công cụ khác. Ngoài ra, bạn cũng có thể sử dụng các công cụ quản lý Kubernetes như kubectl để quản lý cluster của mình. Trong bài lab này mình sẽ sử dụng eksctl và kubectl để quản lý cluster.