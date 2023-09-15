---
title : "Phân bổ tài nguyên cho ứng dụng"
date :  "`r Sys.Date()`" 
weight : 3
chapter : false
pre : " <b> 3.3 </b> "
---
Fargate là một dịch vụ tuyệt vời, dịch vụ được tính tiền dựa trên CPU và memory giúp bạn tối ưu được tài nguyên sử dụng tránh lãng phí. Do đó khi sử dụng Fargate việc phân bổ tài nguyên CPU và memory hợp lý là điều hết sức cần thiết. Trước tiên chúng ta hãy kiểm tra tài nguyên được cấp cho Pod đã được deploy ở phần trước bằng command sau:

```
kubectl get pod -n app-dev -l app=guestbook-ui -o json | jq -r '.items[0].metadata.annotations'
```
Ở phần CapacityProvisioned hiển thị thông tin CPU và Memory của Pod. Đây là size tối thiểu của một Fargate Instance. Những nếu bạn cần một Fargate Instance mạnh mẽ hơn để chạy app của mình hoặc đơn giản là để cho việc chuẩn hóa tài nguyên cho từng Pod. Fargate cung cấp cho chúng ta option để việc này trở nên dễ dàng hơn.
```
```
Apply configure mới và chờ cho việc deploy thành công
```
kubectl apply -k ./app/resource-allocation
kubectl rollout status -n app-dev deployment guestbook-ui --timeout=2m
```
Bây giờ kiểm tra lại tài nguyên được phân bổ cho Pod mới của chúng ta 
```
kubectl get pod -n app-dev -l app=guestbook-ui -o json | jq -r '.items[0].metadata.annotations'
```
Ứng dụng đã được cung cấp Fargate Instance được làm tròn lên gần nhất với yêu cầu của chúng ta
{{% notice info %}}
Tham khảo thêm về các giá trị hợp lệ của Fargate Intance tại đây
{{% /notice %}}