---
title : "Tạo Security groups"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 2.2 </b> "
---
#### Tạo Security groups
Ở phần này chúng ta sẽ cấu hình thêm **security groups** cho VPC mới tạo. Một cái dùng để public port cho **Application Load Balancer** và mở **port** cho **ALB** kết nối tới **port** của các **container** chạy trong private subnets.
1. Trong cửa sổ của VPC.
    - Nhấn chọn **Security groups** trong phần **Security** để chuyển tới màn hình security.
![Cloud Formation](/images/2-prerequiste/2.2-create-security-group/001.png)
2. Trong của sổ **Security groups**
    - Nhấn chọn **Create Sercurity group**
![Cloud Formation](/images/2-prerequiste/2.2-create-security-group/002.png)
3. Trong cửa sổ **Create security group**   
    - Điền tên cho **Security group**, ví dụ **ecs_public_port_sg**
    - Điền **Description**, ví dụ **ecs_public_port_sg**
    - Lựa chọn VPC, chọn VPC vừa mới tạo, ở đây là **ecs**
    - Trong phần **Inbound rules**, chọn **Type** là **HTTP**, **Source** là **Anywhere**.
    - Nhấn chọn **Create security group** để tiến hành tạo security group cho **Load Balancer**.
![Cloud Formation](/images/2-prerequiste/2.2-create-security-group/003.png)
4. Quay lại cửa sổ **Create security group** để tạo security group cho container.
    - Điền tên cho **Security group**, ví dụ **ecs_port_container_sg**
    - Điền **Description**, ví dụ **ecs_port_container_sg**
    - Lựa chọn VPC, chọn VPC vừa mới tạo, ở đây là **ecs**
    - Trong phần **Inbound rules**, chọn **Type** là **Custom TCP**,**Port range** là **8080**, **Source** là Security group  vừa tạo.
    - Nhấn chọn **Create security group** để tiến hành tạo security group cho container.
![Cloud Formation](/images/2-prerequiste/2.2-create-security-group/004.png)