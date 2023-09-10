---
title : "Tạo các services"
date :  "`r Sys.Date()`" 
weight : 1
chapter : false
pre : " <b> 6.1 </b> "
---
#### Tạo các services
1. Truy cập vào cluster được tạo ở [bước 4.1](/content//4-create-cluster-and-task-definition/4.1-create-cluster/) sau đó nhấn chọn **Create** ở tab **Services**
![Create Target groups](/images/6-create-services/001.png)
2. Ở cửa sổ **create** 
    1. **Environment**
    - Compute options, chọn **Launch type**
    - Launch type, chọn **fargate**. Platform version chọn **LASTEST**
    ![Create Target groups](/images/6-create-services/021.png)
    2. **Deployment configuration**
    - Application type, chọn **service**
    - Family, chọn task definition đã tạo ở [bước 4.2](/content/4-create-cluster-and-task-definition/4.2-create-task-definition/), ở đây là **ecs_cluster_td**. Revision chọn **latest**
    - Điền tên service vào **service name**, ví dụ ```ecs-services```
    - Desired tasks. Đây là số lượng task mà bạn muốn chạy, ở đây mình sẽ chọn **2** tương ứng với 2 container. Do trong task definition mình chỉ start 1 container.
    ![Create Target groups](/images/6-create-services/022.png)
    3. **Networking**
    - VPC, chọn **ecs**
    - Subnets, chọn **2 private subnets**
    - Security groups, chọn **use an existing security group**. Chọn 2 security groups: **default** và **ecs_port_container_sg**
    - Tắt **Public IP**, vì container sẽ chạy trong private subnets. Tắt Public IP để tránh lãng phí tài nguyên 
    ![Create Target groups](/images/6-create-services/023.png)
    4. **Load balancing**
    - Load balancer type, chọn **Application Load Balancer**
    - Chọn **use an existing load balancer**, chọn load balancer đã tạo ở [bước 5.2](/content/5-create-alb-and-target-groups/5.2-create-alb/), ở đây là **ecs-cluster-alb**
    - Choose container to load balancer, mặc định là **ecs-image 8080:8080**
    - Target group, chọn **use an existing target group**, chọn target group tạo ở [bước 5.1](/content/5-create-alb-and-target-groups/5.1-create-target-groups/), ở đây là **ecs-container-tg**
    ![Create Target groups](/images/6-create-services/024.png)
    5. Nhấn **Create** để tạo Service
    ![Create Target groups](/images/6-create-services/025.png)