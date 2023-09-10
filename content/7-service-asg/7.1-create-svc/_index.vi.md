---
title : "Tạo service"
date :  "`r Sys.Date()`" 
weight : 1 
chapter : false
pre : " <b> 7.1 </b> "
---
#### Tạo service 
1. **Environment**
    - Compute options, chọn **Launch type**
    - Launch type, chọn **fargate**. Platform version chọn **LASTEST**
![Create SVC](/images/7-service-asg/7.1-create-svc/001.png)
2. **Deployment configuration**
  - Application type, chọn **service**
  - Family, chọn task definition đã tạo ở [bước 4.2](/content/4-create-cluster-and-task-definition/4.2-create-task-definition/), ở đây là **nest_app_td**. Revision chọn **latest**
  - Điền tên service vào **service name**, ví dụ ```ecs_services_asg  ```
  - Desired tasks. Đây là số lượng task mà bạn muốn chạy, ở đây mình sẽ chọn **2** tương ứng với 2 container. Do trong task definition mình chỉ start 1 container.
![Create SVC](/images/7-service-asg/7.1-create-svc/002.png)
3. **Networking**
    - VPC, chọn **ecs_vpc**
    - Subnets, chọn **2 private subnets**
    - Security groups, chọn **use an existing security group**. Chọn 2 security groups: **default** và **ecs_port_container_sg**
    - Tắt **Public IP**, vì container sẽ chạy trong private subnets. Tắt Public IP để tránh lãng phí tài nguyên 
![Create SVC](/images/7-service-asg/7.1-create-svc/003.png)
4. **Load balancing**
  - Load balancer type, chọn **Application Load Balancer**
  - Chọn **use an existing load balancer**, chọn load balancer đã tạo ở [bước 5.2](/content/5-create-alb-and-target-groups/5.2-create-alb/), ở đây là **ecs-cluster-alb**
  - Choose container to load balancer, mặc định là **ecs-image 8080:8080**
  - Target group, chọn **use an existing target group**, chọn target group tạo ở [bước 5.1](/content/5-create-alb-and-target-groups/5.1-create-target-groups/), ở đây là **ecs-container-tg**
![Create SVC](/images/7-service-asg/7.1-create-svc/004.png)
5. **Service auto scaling**
  - Chọn **enable service auto scaling** để tạo auto scaling cho service
  - Minimum number of tasks, chọn **2**. Đây là số lượng task tối thiểu mà service sẽ chạy (1 task = 1 container)
  - Maximum number of tasks, chọn **4**. Đây là số lượng task tối đa mà service sẽ chạy (1 task = 1 container)
  - Scaling policy type, chọn **Target tracking**
  - Policy name, điền tên policy, ví dụ ```alb_request_tracking```
  - ECS service metric, chọn **ALBRequestCountPerTarget**
  - Target value, điền **500**
  - Scale-out cooldown period, điền **30**. Thời gian cooldown sau khi scale-out, khóa không cho scale-out trong thời gian này
  - Scale-in cooldown period, điền **300**. Thời gian cooldown sau khi scale-in, khóa không cho scale-in trong thời gian này
![Create SVC](/images/7-service-asg/7.1-create-svc/005.png)
6. Nhấn **Create** để tạo Service