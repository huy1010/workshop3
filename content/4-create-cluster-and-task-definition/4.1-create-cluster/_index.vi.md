---
title : "Tạo Cluster"
date :  "`r Sys.Date()`" 
weight : 1
chapter : false
pre : " <b> 4.1 </b> "
---

#### Tạo Cluster
1. Nhập ECS vào thanh tìm kiếm và nhấn chọn **Elastic Container Service**
![Create Cluster](/images/4-create-cluster-and-task-definition/4.1-create-cluster/001.png)

2. Ở cửa sổ console của ECS nhấn chọn **Create Cluster** để tiến hành tạo Cluster
![Create Cluster](/images/4-create-cluster-and-task-definition/4.1-create-cluster/002.png)

3. Ở cửa sổ **Create Cluster** chúng ta sẽ cấu hình cluster theo các bước sau
    - Điền tên cluster vào **Cluster name**, ví dụ ```ecs_cluster```
    - Ở phần **Networking** chọn VPC là **ecs**, chọn các subnets là **private subnets**

![Create Cluster](/images/4-create-cluster-and-task-definition/4.1-create-cluster/003.png)

4. Ở phần **Infrastructure**, chúng ta sẽ cấu hình Auto Scaling Group để tự động tạo ra các EC2 instances và gắn vào Cluster. Các bước cấu hình như sau
    - Chọn **Amazon EC2 Intances**
    - Chọn **Create new ASG**
    - Operating System: **Amazon Linux 2**
    - Chọn **t2.micro** ở phần **EC2 instance type** 
    - Desired capacity: Minmum là 2, Maximum là 5
    - SSH Keypair Chọn None
    - Nhấn chọn **Create** để tiến hành tạo cluster.
![Create Cluster](/images/4-create-cluster-and-task-definition/4.1-create-cluster/infra.png)

{{% notice note %}}
Việc chọn các subnet là **private subnets** là để đảm bảo các container của cluster sẽ chỉ chạy được trong nội bộ vpc, nhằm tăng tính bảo mật cho ứng dụng. Khi tạo Cluster với **Auto Scaling Group** với cấu hình như trên, thì sẽ có 2 EC2 instances được khởi chạy và gắng vào Cluster.
{{% /notice %}}