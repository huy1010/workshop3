---
title : "Kiểm tra"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 6.2 </b> "
---
#### Kiểm tra
1. Truy cập vào Application Load Balancer đã tạo ở [bước 5.2](/content/5-create-alb-and-target-groups/5.2-create-alb/), lấy địa chỉ DNS và dáng vào browser.
    - Thông tin ứng dụng sẽ được trả về, phần containerIp tương ứng với private Ip của các task chạy trong VPC.
![Create Target groups](/images/6-create-services/003.png)
![Create Target groups](/images/6-create-services/004.png)
![Create Target groups](/images/6-create-services/005.png)
![Create Target groups](/images/6-create-services/006.png)