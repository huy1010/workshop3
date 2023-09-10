---
title : "Kiểm tra"
date :  "`r Sys.Date()`" 
weight : 3 
chapter : false
pre : " <b> 8.3 </b> "
---
#### Kiểm tra
1. Ping request đến ALB 
```bash
ab -n 100000 -c 200 <dns-name>
```
2. Kết quả
Vào CloudWatch, nhấn chọn All Alarm, bạn sẽ thấy alarm của service ở trạng thái **In Alarm**
![Load Test](/images/8-cluster-asg/8.3-load-test/002.png)
Đây là event log của deployment
![Load Test](/images/8-cluster-asg/8.3-load-test/003.png)
Các instances được khởi chạy thêm theo ASG
![Load Test](/images/8-cluster-asg/8.3-load-test/004.png)
Các task được khởi chạy thêm
![Load Test](/images/8-cluster-asg/8.3-load-test/005.png)
