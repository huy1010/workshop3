---
title : "Tạo service"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 8.2 </b> "
---
#### Tạo service
1. Ở phần **Environment**, Chọn **Capacity Provider strategy**, sau đó chọn **use cluster default**
![Create Service](/images/8-cluster-asg/8.2-create-service/001.png)
2. Ở phần **Deployment configuration**
  - Chọn **Application type** là **service**
  - Chọn **Task definition** là **nest_app_td**
  - Điền **Service name** là **svc-cluster-asg**
  - **Desired tasks** là **2**
![Create Service](/images/8-cluster-asg/8.2-create-service/002.png)
3. Ở phần **Networking**
  - Chọn **VPC** là **ecs_vpc**
  - Chọn **Subnets** là **2 private subnets**
  - Chọn **Security groups** là **use an existing security group**, chọn 2 security groups: **default** và **ecs_port_container_sg**
  - Tắt **Public IP**
![Create Service](/images/8-cluster-asg/8.2-create-service/003.png)
4. Ở phần **Load balancing**
  - Load balancer type, chọn **Application Load Balancer**
  - Chọn **use an existing load balancer**, chọn load balancer đã tạo ở [bước 5.2](/content/5-create-alb-and-target-groups/5.2-create-alb/), ở đây là **ecs-alb**
  - Choose container to load balancer, mặc định là **ecs-container 8080:8080**
  - Target group, chọn **use an existing target group**, chọn target group tạo ở [bước 5.1](/content/5-create-alb-and-target-groups/5.1-create-target-groups/), ở đây là **nest-app-tg**
  - Health check grace period, chọn **20**
![Create Service](/images/8-cluster-asg/8.2-create-service/004.png)
5. **Service auto scaling**
 - Chọn **enable service auto scaling** để tạo auto scaling cho service
  - Minimum number of tasks, chọn **2**
  - Maximum number of tasks, chọn **4**
  - Scaling policy type, chọn **Target tracking**
  - Policy name, điền tên policy, ví dụ ```alb_request_tracking```
  - ECS service metric, chọn **ALBRequestCountPerTarget**
  - Target value, điền **500**
  - Scale-out cooldown period, điền **30**
  - Scale-in cooldown period, điền **300**
  - Nhấn Create để tạo service
![Create Service](/images/8-cluster-asg/8.2-create-service/005.png)