---
title : "Tạo Application Load Balancer"
date :  "`r Sys.Date()`" 
weight : 2
chapter : false
pre : " <b> 5.2 </b> "
---
### Tạo Application Load Balancer
1. Chọn **Load Balancer** ở phần **Load Balancing** 
![Create Target groups](/images/5-create-alb-and-target-groups/5.2-create-alb/001.png)
2. Nhấn chọn **Create load balancer**
![Create Target groups](/images/5-create-alb-and-target-groups/5.2-create-alb/002.png)
3. Nhấn **Create** ở phần **Application Load Balancer**
![Create Target groups](/images/5-create-alb-and-target-groups/5.2-create-alb/003.png)
4. Ở trang **Create Applicatioin Load Balancer**

    Phần **Basic Configuration**
    - Điền tên vào **Load balancer name**, ví dụ ```ecs-cluster-alb```
    - **Scheme**, chọn **Internet-facing**
    - **IP address type**, chọn **IPv4**
![Create Target groups](/images/5-create-alb-and-target-groups/5.2-create-alb/005.png)
    - Phần **Networking**, VPC chọn **ecs**, chọn tiếp **2 public subnets**
![Create Target groups](/images/5-create-alb-and-target-groups/5.2-create-alb/006.png)
    - Phần **Security groups**, chọn **ecs-public-port-sg**
    - Phần **Listeners and routing**, **Protocol** là **HTTP**, **Port** là **80**, **default action** chọn **ecs-container-tg**
![Create Target groups](/images/5-create-alb-and-target-groups/5.2-create-alb/007.png)
    - Review lại và nhấn **Create load balancer** để tiến hành tạo load balancer.
![Create Target groups](/images/5-create-alb-and-target-groups/5.2-create-alb/008.png)
