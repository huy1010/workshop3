---
title : "Scaling workload với Fargate"
date :  "`r Sys.Date()`" 
weight : 4
chapter : false
pre : " <b> 3.4 </b> "
---
Khi chạy cluster với Fargate bạn không cần phải lo lắng về việc mở rộng các **worker node** cho cluster của mình. Đây là ưu điểm tuyệt vời của Fargate
Hãy thử mở rộng ứng dụng với configure sau và kiểm chứng
```yaml
# patch app/scaling-workload/guestbook-ui-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: guestbook-ui
spec:
  replicas: 3
```
Apply kustomization mới và chờ việc deploy thành công
```
kubectl apply -k ./scaling-workload
kubectl rollout status -n app-dev deployment/guestbook-ui --timeout=2m
```
Sau khi deploy hoàn thành, hãy cùng kiểm tra số lượng Pod đang chạy
```
kubectl get pod -n app-dev -l app=guestbook-ui
```
![Fargate](/images/3-fargate/scaling-001.png)
Mỗi Pod được chạy trên một Fargate instance riêng biệt. Hãy kiểm tra thông tin của các node cho từng Pod
```
kubectl get pod -n app-dev -l app=guestbook-ui -o json | jq -r '.items[].spec.nodeName'
```
![Fargate](/images/3-fargate/scaling-002.png)

Finish! Chúng ta đã hoàn thành các thao tác cơ bản của eks với fargate mode. Hãy tiếp tục với phần tiếp theo để tìm hiểu về cách sử dụng Fargate Profile để quản lý việc chạy Pod trên Fargate

{{% notice info %}}
Tham khảo thêm về Fargate Profile tại đây
{{% /notice %}}