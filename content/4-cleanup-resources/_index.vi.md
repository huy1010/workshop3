---
title : "Dọn dẹp tài nguyên"
date :  "`r Sys.Date()`" 
weight : 4 
chapter : false
pre : " <b> 4. </b> "
---

#### Dọn dẹp tài nguyên

1. Chạy câu lệnh sau đây để xóa các Objects có trong cluster của chúng ta
```
kubectl delete -k -R ./
```
2. Xóa cluster bằng câu lệnh sau đây
```
eksctl delete cluster --name fargate-cluster
```
![Clean up](/images/4-clean-up/001.png)

3. Kiểm tra lại Stack được tạo ra trên **CloudFormation** và chờ cho việc xóa hoàn tất hoặc xóa bằng tay cluster đã tạo trên **CloudFormation**
![Clean up](/images/4-clean-up/002.png)
4. Xóa Stack đã tạo Cloud9 IDE
    - Nhấn chọn Cloud9 Stack
    - Nhấn **Delete** để tiến hành xóa Stack
![Clean up](/images/4-clean-up/003.png)