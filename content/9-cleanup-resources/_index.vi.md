---
title : "Dọn dẹp tài nguyên"
date :  "`r Sys.Date()`" 
weight : 9 
chapter : false
pre : " <b> 9. </b> "
---

#### Dọn dẹp tài nguyên
1. Xóa services
    - Chọn ecs-services sau đó nhấn **Delete service**
    - Tiếp tục với các service còn lại
![Clean up](/images/9-cleanup-resources/001.png)
2. Confirm
    - Nhấn chọn **Force delete service**
    - Gõ **delete** 
    - Nhấn **Delete** để xóa, tương tự với các confirm bên dưới
![Clean up](/images/9-cleanup-resources/002.png)
3. Truy cập vào cluster sau đó nhấn **Delete cluster**, sau đó confirm để xóa
![Clean up](/images/9-cleanup-resources/003.png)
4. Truy cập vào task definition đã tạo
    - Nhấn chọn revision sau đó chọn **Deregister** ở phần **Actions**
    - Confirm để xóa
![Clean up](/images/9-cleanup-resources/004.png)
5. Chuyển filter sang **Inactive task definitions**
    - Nhấn chọn revision sau đó chọn **Delete** ở phần **Actions**
    - Confirm để xóa
![Clean up](/images/9-cleanup-resources/005.png)
6. Truy cập vào **Target groups** 
    - Nhấn chọn target group đã tạo, sau đó nhấn **Delete**
    - Confirm để xóa 
![Clean up](/images/9-cleanup-resources/006.png)
7. Truy cập vào **Load balancers** 
    - Nhấn chọn load balancer đã tạo, sau đó nhấn **Delete load balancer**
    - Confirm để xóa 
![Clean up](/images/9-cleanup-resources/007.png)
8. Truy cập vào **Security groups** 
    - Nhấn chọn security group đã tạo, sau đó nhấn **Delete security groups**
    - Confirm để xóa 
{{% notice note  %}}
Xóa **ecs_port_container_sg** trước, sau đó mới xóa **ecs_public_port_sg**
{{% /notice %}}
![Clean up](/images/9-cleanup-resources/008.png)
9. Truy cập vào **Cloud Formation**
    - Nhấn chọn stack đã tạo, sau đó nhấn **Delete**
    - Confirm để xóa 
![Clean up](/images/9-cleanup-resources/009.png)
10. Truy cập vào **Amazon ECR**
    - Nhấn chọn repository đã tạo, sau đó nhấn **Delete**
    - Confirm để xóa 
![Clean up](/images/9-cleanup-resources/010.png)

