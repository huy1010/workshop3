---
title : "Các bước chuẩn bị"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 2. </b> "
---

{{% notice info %}}
Chúng ta sẽ khởi tạo 1 VPC với 2 public subnets, 2 private subnets, 1 internet gateway, default route cho các public subnets. 2 NAT gateway cho các private subnets. NAT gateway sẽ tốn phí nên cần xóa khi không sử dụng nữa.
{{% /notice %}}

Để tìm hiểu cách tạo VPC với public/private subnet các bạn có thể tham khảo bài lab :
  - [Làm việc với Amazon VPC](https://000003.awsstudygroup.com/vi/)

Ở phần này chúng ta sẽ khởi tạo môi trường mạng để cho các service trong cluster cũng như load balancer được hoạt động. Dưới đây là kết quả sau khi tạo VPC và nơi các ECS được hoạt động.
![VPC diagrams](/images/2-prerequiste/vpc_diagrams.png) 

### Nội dung
  - [Chuẩn bị VPC](2.1-create-vpc/)
  - [Tạo thêm các security groups](2.2-create-security-groups/)

  
