---
title : "Kubernetes Components cơ bản"
date :  "`r Sys.Date()`" 
weight : 3 
chapter : false
pre : " <b> 1.3 </b> "
---
### Kubernetes Components cơ bản
Trong phạm vi bài lab, mình sẽ chỉ giới thiệu tới các component cơ bản nhất được sử dụng trong lab. Các bạn có thể tìm hiểu thêm về các component khác tại [đây](https://kubernetes.io/docs/concepts/overview/components/).
#### Pods
Khi một ứng dụng được đóng gói thì ứng dụng đó sẽ có thể chạy trên một container độc lập, tuy chúng ta có thể chạy container độc lập như cách khởi chạy một ứng dụng monolythic, nhưng Kubernetes sẽ không chạy theo cách như vậy, Kubernetes sử dụng khái niệm pod để nhóm các container lại với nhau. Một pod là một nhóm các container, các container này sẽ dùng chung tài nguyên và network, các container trong một pod có thể duy trì giao tiếp với nhau như trên một máy chủ nhưng vẫn giữ được sự độc lập cần thiết.
#### Deployments
Trong Kubernetes, đối tượng Deployment là đối tượng chính đảm nhận việc deploy và quản lý ứng dụng của chúng ta. Nó cho phép chúng ta deploy các Pod, update Pod, rollback Pod
#### Namespaces
Namespace là một thành phần logic được Kubernetes sử dụng để xác định phạm vi quản lý các resource. Mặc định, Kubernetes sẽ tạo ra một namespace có tên là default, tất cả các resource được tạo ra mà không chỉ định namespace sẽ được tạo ra trong namespace default. Các bạn có thể tạo ra các namespace khác để phân chia các resource trong cluster.
#### Services
Kubernetes service là một tài nguyên xác định ra một pod hoặc một nhóm các pod cung cấp cùng một dịch vụ và chính sách truy cập đến các pod đó. Đối với service, Kubernetes cũng cung cấp cho chúng ta nhiều kiểu service khác nhau để phù hợp với nhiều yêu cầu khác nhau.
