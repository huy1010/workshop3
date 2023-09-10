---
title : "Cập nhật Cluster"
date :  "`r Sys.Date()`" 
weight : 1 
chapter : false
pre : " <b> 8.1 </b> "
---
#### Cập nhật Cluster
Ở phần này chúng ta sẽ tiến hành cập nhập security groups cho các instance chạy trong Auto Scaling Group của cluster. Các bước thực hiện như sau:
1. Truy cập vào cluster của bạn, sau đó chọn tab **Infrastructure**
   Sẽ có thông tin của Auto Scaling Group và 2 EC2 Instance được khởi chạy bởi ASG
![Update Cluster](/images/8-cluster-asg/8.1-create-cluster/001.png)
2. Truy cập vào EC2, sau đó chọn Launch Templetes
![Update Cluster](/images/8-cluster-asg/8.1-create-cluster/002.png)
3. Chọn Templete của ASG, sau đó chọn **Modify templete**
![Update Cluster](/images/8-cluster-asg/8.1-create-cluster/003.png)
4. Ở phần Network settings, chọn thêm 2 sercurity groups: **ecs_port_container_sg** và **default**, sau đó nhấn Create templete version để cập nhật
![Update Cluster](/images/8-cluster-asg/8.1-create-cluster/004.png)
5. Truy cập vào ASG của cluster, kéo tới phần **Lauch templete**, chọn **Edit**
![Update Cluster](/images/8-cluster-asg/8.1-create-cluster/005.png)
6. Tiến hành chọn lại version mới nhất vừa được cập nhật, sau đó lưu lại
![Update Cluster](/images/8-cluster-asg/8.1-create-cluster/006.png)