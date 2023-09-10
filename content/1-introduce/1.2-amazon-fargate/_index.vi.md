---
title : "Amazon Fargate"
date :  "`r Sys.Date()`" 
weight : 2 
chapter : false
pre : " <b> 1.2 </b> "
---
### Amazon Fargate
**Amazon Fargate**, là một dịch vụ container serverless. Khi khởi chạy các container của bạn trên EKS với fargate bạn sẽ không cần quan tâm về việc cấp phát, quản lý, mở rộng các cụm EC2. Bạn chỉ cần tập trung vào việc triển khai các ứng dụng của mình. Fargate sẽ giúp bạn quản lý các tài nguyên cần thiết để chạy các ứng dụng của bạn. Ngoài ra, bạn cũng có thể sử dụng Fargate để chạy các ứng dụng container trên ECS.

Bạn có thể kiểm soát Pod khởi chạy trên Fargate và cách chúng chạy. Amazon EKS tích hợp Kubernetes với Fargate bằng cách sử dụng controllers do AWS xây dựng. Các controllers này chạy như một phần control plane của Kubernetes do Amazon EKS quản lý và chịu trách nhiệm lên lịch cho các Kubernetes Pod trên Fargate. Khi bạn khởi chạy một Pod đáp ứng các tiêu chí để chạy trên Fargate, Controller Fargate đang chạy trong cluster sẽ nhận dạng, cập nhật và lên lịch Pod chạy trên Fargate mode.
#### Fargate profile 
Trước khi khởi chạy bất kì Pod nào trên Fargate bận cần phải define Fargate profile trên cluster. Các thành phần của Fargate profile bao gồm:
- **Selectors**: Các selectors được sử dụng để xác định các Pod nào sẽ được khởi chạy trên Fargate. Các selectors này có thể là namespace, label, hoặc annotation của Pod.
- **Subnets**: Các subnets được sử dụng để khởi chạy các Pod trên Fargate. Các subnets này phải là private subnets.
- **Pod execution role**: Các Pod sẽ được khởi chạy trên Fargate sẽ được gán một IAM role. Role này sẽ được sử dụng để ghi log, truy cập vào các service khác như ECR, S3, và các service khác của AWS.

#### Các điểm đặc biệt cần biết khi chạy Kubernetes trên Fargate
1. Mỗi Pod chạy trên Fargate sẽ có một địa chỉ IP riêng biệt. các Pod sẽ không chia sẽ CPU, Memory, địa chỉ IP với các Pod khác.
2. Các pod bắt buộc phải match với Fargate profile lúc chúng được lên lịch khởi chạy. Những Pod không match với Farmgate profile sẽ không được khởi chạy và sẽ ở trạng thái Pending.
3. Pods chạy trên Fargate chỉ support cho các private subnets. Nên VPC chứa cluster cần phải có ít nhất 1 private subnet.
 
{{% notice info %}}
Trên đây chỉ là các lưu ý cơ bản khi khởi chạy Fargate mode. Bạn có thể tìm hiểu thêm về Fargate mode tại [đây](https://docs.aws.amazon.com/eks/latest/userguide/fargate.html#fargate-considerations).
{{% /notice %}}