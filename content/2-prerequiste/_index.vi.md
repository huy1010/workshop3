---
title : "Chuẩn bị môi trường"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 2. </b> "
---
Ở phần này chúng ta sẽ tạo một Cloud9 IDE được grant các permission để thao tác với aws eks thông qua CloudFormation.

1. Truy cập đến **CloudFormation Management Console** bằng cách gõ CloudFormation vào thanh tìm kiếm sau đó nhấn chọn **Create Stack** để tiến hành tạo stack
![Prerequiste](/images/2-prerequiste/001.png)
2. Trong phần Create Stack
    - Chọn Upload a template file
    - Upload templete lại đường link sau đây 
    - Nhấn chọn Next để tiếp tục
![Prerequiste](/images/2-prerequiste/002.png)
3. Ở phần Specify stack details
    - Điền tên của stack vào Stack name, ví dụ ```Cloud9 Stack```
    - Nhấn chọn Next để tiếp tục
![Prerequiste](/images/2-prerequiste/003.png)
4. Ở phần Configure stack details
    - Để mọi thứ mặc định và nhấn Next để tiếp tục
5. Ở phần Review Stack
    - Tích chọn mục **I acknowledge that AWS CloudFormation might create IAM resources.** để xác nhận việc stack sẽ được phép tạo iam role và gắn vào instance của cloud9. Điều này cho phép cloud9 có quyền thao tác với aws của bạn
    - Nhấn Submit để tiến hành tạo Stack
![Prerequiste](/images/2-prerequiste/004.png)
{{% notice info %}}
Bạn cần chờ một khoản thời gian tầm 5 phút để CloudFormation tạo xong stack. Bạn có thể theo dõi quá trình tạo stack bằng cách chọn stack vừa tạo và chọn tab **Events**. Khi quá trình tạo stack hoàn tất, bạn sẽ thấy trạng thái của stack là **CREATE_COMPLETE**.
{{% /notice %}}