---
title : "Attach IAM Role vào Cloud9 Instance"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 2.2 </b> "
---
Ở bước này chúng ta sẽ gắn roles vào cho **EC2 intances** đang chạy cloud9 để có quyền tương tác với aws. Bắt đầu theo các bước sau đây:

1. Trước tiên truy cập vào **EC2** bằng cách nhấn vào **Manage EC2 Instance**
![Prerequiste](/images/2-prerequiste/008.png)
2. Tích chọn **EC2 instance** đang chạy cloud9 và chọn **Actions** -> **Sercurity** -> **Modify IAM Role**
![Prerequiste](/images/2-prerequiste/009.png)
3. Chọn Cloud9-MyCloud9InstanceProfile và nhấn **Update IAM Role** để lưu lại
![Prerequiste](/images/2-prerequiste/010.png)
4. Trở về **Cloud9 IDE** và chọn chạy command sau update lại policy cho **Cloud9**
   ```bash
   sudo bash update_policy.sh
   ```
5. Chạy command sau để xác thực lại việc attach IAM role vào **Cloud9**
    ```bash
    aws sts get-caller-identity --query Arn | grep MyCloud9Role -q && echo "IAM role valid" || echo "IAM role not valid"
    ```
    Nếu kết quả trả về là **IAM role valid** thì bạn đã hoàn thành bước này
    ![Prerequiste](/images/2-prerequiste/011.png)