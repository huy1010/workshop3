---
title : "Khởi Tạo VPC"
date :  "`r Sys.Date()`" 
weight : 1
chapter : false
pre : " <b> 2.1 </b> "
---

### KHỞI TẠO AWS VPC với CloudFormation Template
Trong phần này chúng ta sẽ khởi tạo VPC thông qua **Cloud Formation** bằng cái tải lên file yml đã cấu hình sẵn theo [link sau](https://github.com/huy1010/nest-app-example/blob/master/template.yml).

1. Truy cập đến **CloudFormation Management Console** bằng cách gõ **CloudFormation** vào thanh tìm kiếm 
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/001.png)
2. Trong giao diện của **CloudFormation**
    - Nhấn chọn **Create Stack**
    - Nhấn chọn **With new resources (standard)**
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/002.png)
3. Trong giao diện **Create Stack**
    - Ở phần **Prepare templete**, nhấn chọn **Templete is ready**
    - Ở phần **Templete source**, chọn **Upload a templete file**
    - Nhấn vào **Choose file** để tải lên file đã tải về theo link ở trên
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/003.png)
4. Trong phần **Specify stack details**
    - Điền tên stack vào **Stack name**. Ví dụ **ECS**.
    - Điền tên của VPC vào phần **Environment Name**. Ví dụ **ecs**
    - Nhấn **Next** để tiếp tục.
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/004.png)
5. Trong phần **Configure stack options**
    - Nhấn **Next** để tiếp tục
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/005.png)
6. Trong phần **Review**
    - Xem lại và kiểm tra các thông số và nhấn **Submit** để tiến hành khởi tạo VPC
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/006.png)
Sau khi chờ khoản  5 phút thì status của stack sẽ chuyển sang thành công.
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/007.png)
7. Truy cập đến **VPC console** bằng cách gõ **VPC** vào ô tìm kiếm và chọn VPC ở bên dưới.
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/008.png)
8. Dưới đây là thông tin VPC bạn vừa mới tạo
![Cloud Formation](/images/2-prerequiste/2.1-create-vpc/009.png)