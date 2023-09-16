---
title : "Tạo Cloud9 IDE bằng CloudFormation"
date :  "`r Sys.Date()`" 
weight : 1 
chapter : false
pre : " <b> 2.1 </b> "
---
Ở phần này chúng ta sẽ tạo một Cloud9 IDE thông qua **CloudFormation**.

1. Truy cập đến **CloudFormation Management Console** bằng cách gõ CloudFormation vào thanh tìm kiếm sau đó nhấn chọn **Create Stack** để tiến hành tạo stack
![Prerequiste](/images/2-prerequiste/001.png)

2. Trong phần **Create Stack**
    - Chọn **Upload a template file**
    - Upload templete lại đường link sau [đây](https://raw.githubusercontent.com/huy1010/sources/main/cloudformation.yaml) 
    - Nhấn chọn **Next** để tiếp tục

  ![Prerequiste](/images/2-prerequiste/002.png)

3. Ở phần **Specify stack details**
    - Điền tên của stack vào Stack name, ví dụ ```Cloud9 Stack```
    - Nhấn chọn **Next** để tiếp tục
![Prerequiste](/images/2-prerequiste/003.png)

4. Ở phần **Configure stack details**
    - Để mọi thứ mặc định và nhấn **Next** để tiếp tục
  
5. Ở phần **Review Stack**
    - Tích chọn mục **I acknowledge that AWS CloudFormation might create IAM resources.** để xác nhận việc stack sẽ được phép tạo iam role và gắn vào instance của cloud9. Điều này cho phép cloud9 có quyền thao tác với aws của bạn
    - Nhấn **Submit** để tiến hành tạo Stack
     
![Prerequiste](/images/2-prerequiste/004.png)

{{% notice info %}}
Bạn cần chờ một khoản thời gian tầm 5 phút để CloudFormation tạo xong stack. Bạn có thể theo dõi quá trình tạo stack bằng cách chọn stack vừa tạo và chọn tab **Events**.
{{% /notice %}}

Khi quá trình tạo stack hoàn tất, truy cập vào tab **Outputs** để lấy đường link của Cloud9 IDE.
![Prerequiste](/images/2-prerequiste/005.png)

Sau khi truy cập được vào **Cloud9 IDE**, bạn sẽ thấy một màn hình như sau:
![Prerequiste](/images/2-prerequiste/006.png)

Trước tiên hãy clone source mình đã chuẩn bị sẳn bằng command sau đây
```bash
git clone https://github.com/huy1010/sources.git
```
Tiếp theo hãy cài đặc các package cần thiết cho bài lab bằng command sau đây
```bash
cd sources 
sudo bash installer.sh
```
Đây là kết quả mình nhận được

![Prerequiste](/images/2-prerequiste/007.png)