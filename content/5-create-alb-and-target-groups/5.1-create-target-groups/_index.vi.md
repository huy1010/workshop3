---
title : "Tạo Target groups"
date :  "`r Sys.Date()`" 
weight : 1
chapter : false
pre : " <b> 5.1 </b> "
---
#### Create Target groups
1. GÕ vào thanh tìm kiếm **EC2**, sau đó chọn **EC2**
![Create Target groups](/images/5-create-alb-and-target-groups/5.1-create-target-groups/001.png)
2. Ở cửa sổ console của EC2
    - Ở menu, tìm tới phần **Load Balancing**, chọn **Target Groups**
    - Chọn **Create target groups**
![Create Target groups](/images/5-create-alb-and-target-groups/5.1-create-target-groups/002.png)
3. Ở cửa sổ Create target group

    Ở phần Basic Configuration
    - Chọn **IP addresses**
    - Điền **target group name**, ví dụ ```ecs-container-tg```
    - Chọn protocol **HTTP**, **Port 80**
    - **IP address type**, chọn **IPv4**
    - Chọn VPC là **ecs**,
    - **Protocol version** chọn **HTTP1**
![Create Target groups](/images/5-create-alb-and-target-groups/5.1-create-target-groups/005.png)
    Trong phần **Advanced health check settings**, chọn theo như hình bên dưới, mục đính làm giảm thời gian chờ đợi healcheck thành công. 
    - **Healthy threshold** có nghĩa là số lần healthy liên tiếp để được đánh healthy
    - **Unhealthy threshold** có nghĩa là số lần unhealthy liên tiếp để được đánh unhealthy
    - **Interval** là khoảng thời gian giữa 2 lần healcheck
    - **Timeout** là thời gian tối đa để chờ healcheck thành công
    - **Success codes** là mã trả về khi healcheck thành công
    - Nhấn **Next** để sang bước tiếp theo  
![Create Target groups](/images/5-create-alb-and-target-groups/5.1-create-target-groups/006.png)
4. Ở phần **Register targets**
    - Để mọi thứ mặc định, kiểm tra lại VPC và nhấn **Create target group** để tạo group
![Create Target groups](/images/5-create-alb-and-target-groups/5.1-create-target-groups/004.png)