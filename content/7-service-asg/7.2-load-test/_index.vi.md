---
title : "Kiểm tra"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 7.2 </b> "
---
#### Kiểm tra
1. Tải apache benchmark về máy
```bash
sudo apt-get install apache2-utils
```
2. Ping request đến ALB 
```bash
ab -n 100000 -c 200 <dns-name>
```
3. Kết quả
Vào CloudWatch, nhấn chọn All Alarm, bạn sẽ thấy alarm của service ở trạng thái **In Alarm**
![Load test SVC](/images/7-service-asg/7.2-load-test/002.png)
Chờ thêm vài phút các task sẽ được tăng lên 4
![Load test SVC](/images/7-service-asg/7.2-load-test/003.png)
Đây là event log của deployment
![Load test SVC](/images/7-service-asg/7.2-load-test/004.png)