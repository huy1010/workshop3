---
title : "Kiến trúc cơ bản của Kubernetes"
date :  "`r Sys.Date()`" 
weight : 1 
chapter : false
pre : " <b> 1.3.1 </b> "
---

![Architect](/images/1-introduce/001.png)
Một cụm cluster sẽ gồm nhiều máy chạy với nhau gọi là node. để quản lý các node trong cũng như việc giao tiếp giữa các node với nhau, Kubernetes sử dụng Control Plane được đặt tại Master Node. Những node còn lại được dùng để chạy các workloads gọi là Worker node.
### Control Plane
Là phần đầu của Kubernetes, nơi chứa các thành phần quản lý và điều khiển các node trong cluster. Control Plane bao gồm các thành phần sau:
#### API Server
Là thành phần chịu trách nhiệm cung cấp API cho các thành phần khác trong Control Plane. API Server cũng là thành phần duy nhất trong Control Plane có thể truy cập từ bên ngoài cluster. Dùng để tương tác với cluster thông qua API
#### Scheduler
Là thành phần chịu trách nhiệm lên lịch chạy các Pod trên các node trong cluster. Scheduler sẽ chọn ra node phù hợp để chạy Pod dựa trên các yêu cầu của Pod đó.
#### Controller Manager
Là thành phần chịu trách nhiệm quản lý các controller trong cluster. Có rất nhiều thành phần cần được quản lý trong Cluster controllers sinh ra để làm việc đó. Các bạn có thể tìm hiểu thêm về Controller tại [đây](https://kubernetes.io/docs/concepts/architecture/controller/). Nói đơn giản, Controller Manager là tổng hợp các controller trong cluster lại.
#### etcd
Là thành phần chịu trách nhiệm lưu trữ dữ liệu của cluster. etcd là một key-value store được sử dụng để lưu trữ thông tin cấu hình của cluster. Các thành phần trong Control Plane sẽ lưu trữ thông tin của chúng vào etcd. Các thành phần khác trong cluster sẽ lấy thông tin từ etcd để thực hiện các tác vụ của mình.
### Worker Nodes
Là nơi chạy các workloads của cluster. Mỗi node sẽ chạy một hoặc nhiều Pod. Worker Nodes bao gồm các thành phần sau:
#### Kubelet
Là thành phần chịu trách nhiệm quản lý các Pod trên node. Kubelet sẽ nhận các yêu cầu từ API Server và thực hiện các tác vụ đó trên node. Kubelet cũng sẽ gửi các thông tin về trạng thái của node lên API Server để các thành phần khác trong Control Plane có thể lấy thông tin đó.
#### Kube-proxy
Là thành phần chịu trách nhiệm quản lý mạng trên node. Kube-proxy sẽ tạo ra các rule để các Pod có thể giao tiếp với nhau. Kube-proxy cũng sẽ tạo ra các rule để các Pod có thể giao tiếp với bên ngoài cluster.
#### Container Runtime
Là thành phần chịu trách nhiệm quản lý các container trên node. Container Runtime sẽ tạo ra các container dựa trên các yêu cầu từ Kubelet. Container Runtime cũng sẽ gửi các thông tin về trạng thái của các container lên Kubelet để các thành phần khác trong Control Plane có thể lấy thông tin đó.
### Kubectl
Là công cụ dùng để tương tác với cluster thông qua API Server. Kubectl sẽ gửi các yêu cầu của người dùng lên API Server và nhận các kết quả trả về từ API Server. Kubectl cũng sẽ gửi các yêu cầu của người dùng lên API Server và nhận các kết quả trả về từ API Server. Tìm hiểu thêm về Kubectl tại [đây](https://kubernetes.io/docs/reference/kubectl/overview/).