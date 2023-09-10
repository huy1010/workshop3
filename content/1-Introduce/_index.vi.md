---
title : "Giới thiệu"
date :  "`r Sys.Date()`" 
weight : 1 
chapter : false
pre : " <b> 1. </b> "
---
### Amazon Elastic Container Service (ECS)
**Amazon Elastic Container Service (Amazon ECS)**, theo định nghĩa của AWS là một dịch vụ quản lý container có khả năng mở rộng cao, dễ dàng run, stop, hay quản lý docker container ở trong một cluster. Bạn có thể host một serverless infrastructure bằng cách chạy service hay task sử dụng Fargate launch type hoặc sử dụng EC2 launch type để chạy các EC2 instance.
ECS chạy các container trong cluster dựa trên các EC2 được cài sẵn Docker. Bạn có thể dễ dàng quản lý các container của mình thông qua Cluster. ECS là một dịch vụ chạy theo region, và nó hoạt động trong VPC. Sau khi một cluster được khởi tạo và chạy, bạn có thể định nghĩa các task và services mà nó chỉ định Docker container image sẽ chạy thông qua clusters. ECS có hai dạng được triển khai là chạy trên các EC2 và serverless(fargate). 
### Các thành phần khác
#### Task definition
**Task definition** là một bản thiết kế cho ứng dụng của bạn. Nó sẽ định nghĩa image nào được chạy trong container, giới hạn sử dụng CPU và bộ nhớ cho mỗi container được chạy. Lựa chọn các mode networking của Docker có trên AWS ECS và port.
#### Task
Mỗi một Task tương ứng với mỗi bản Task definition được chạy trên cluster. Nhiều task có thể được chạy bởi cùng một Task definition. Với mỗi một task sử dụng Fargate launch type có một ranh giới riêng biệt và không chia sẻ kernel, tài nguyên cpu, bộ nhớ, hay elastic network interface với task khác.
#### Service
Xác định mức tối thiểu và tối đa của một hoặc nhiều Task từ một Task Definition chạy tại bất kỳ thời điểm nhất định nào. Đây là tính năng scale và cân bằng tải. Service còn quy định việc các task được chạy ở đâu ở các subnets.