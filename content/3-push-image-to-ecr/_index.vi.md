---
title : "Build và Push image lên ECR"
date :  "`r Sys.Date()`" 
weight : 3 
chapter : false
pre : " <b> 3. </b> "
---
#### Build và Push image lên Elastic Container Registry
Trong phần này bạn sẽ clone repository từ github theo [link sau](https://github.com/huy1010/nest-app-example). Sau đó sử dụng **docker** và **aws cli** để **build** và **push** image lên **Elastic Container Registry (ECR)**.
1. Nhập **ECR** vào thanh tìm kiếm sau đó chọn **Elastic Container Registry**
![ECR](/images/3-push-image-to-ecr/001.png)
2. Ở cửa sổ ECR nhấn vào **Get Started** để tạo Repository
![ECR](/images/3-push-image-to-ecr/002.png)
3. Ở cửa sổ **Create Repository**
    - Ở phần **Visibility Settings** chọn **Private**
    - Nhập tên của repository vào phần **Repository name**, Ví dụ **ecs-image**.
    - Nhấn vào **Create Repository** để tạo Repo
![ECR](/images/3-push-image-to-ecr/003.png)

{{% notice note %}}
Để tiếp tục ở các bước tiếp theo các bạn cần phải cài đặt **git**, **docker engine**, và setup **aws cli** ở máy tính của mình trước.
{{% /notice %}}

4. Mở cửa sổ **terminal** ở máy tính của bạn.
    - Clone repository mà mình đã tạo sẵn trên **github**, ```git clone https://github.com/huy1010/nest-app-example.git```
    - Cd vào thư mục của repository, ```cd nest-app-example```
![ECR](/images/3-push-image-to-ecr/006.png)
![ECR](/images/3-push-image-to-ecr/007.png)
5. Truy cập vào *repository* vừa tạo trên **ECR**
    - Nhấn chọn **View push commands** để xem các câu lệnh **cmd** dùng để push image lên **Registry**.
![ECR](/images/3-push-image-to-ecr/004.png)
6. Lần lượt dán các câu lệnh như hình bên dưới vào cửa sổ **terminal** tại thư mục gốc của **repository** vừa mới clone để push image lên repository của **ECR** vừa mới tạo
Thứ tự các câu lệnh tương đương với các nội dung sau:
    - Authenticate Docker với **ECR**
    - Build docker image từ Dockerfile
    - Gắn tag image vừa build với tên của repository trên **ECR**
    - Push image lên **ECR**
![ECR](/images/3-push-image-to-ecr/005.png)
7. Dưới đây là ví dụ về kết quả hiển thị trên repository của ECR khi push image thành công.
![ECR](/images/3-push-image-to-ecr/008.png)



