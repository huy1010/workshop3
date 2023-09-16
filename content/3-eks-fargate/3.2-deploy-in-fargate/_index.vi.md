---
title : "Deploy ứng dụng trong Fargate"
date :  "`r Sys.Date()`" 
weight : 2
chapter : false
pre : " <b> 3.2 </b> "
---
Trong phần này chúng ta sẽ tạo 2 object là **Deployment** và **Service** để deploy ứng dụng trong Fargate. Deployment sẽ tạo ra 1 Pod chạy ứng dụng. Service sẽ tạo ra một **AWS Load Balancer** để truy cập vào ứng dụng.

Đây là file configure cho **Deployment** và **Service**:
```yml
### Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: guestbook-ui
  namespace: app-dev
spec:
  replicas: 1
  revisionHistoryLimit: 3
  selector:
    matchLabels:
      app: guestbook-ui
  template:
    metadata:
      labels:
        app: guestbook-ui
        fargate: 'yes'
    spec:
      containers:
      - image: gcr.io/heptio-images/ks-guestbook-demo:0.1
        name: guestbook-ui
        ports:
        - containerPort: 80
### Service
apiVersion: v1	
kind: Service	
metadata:	
  name: guestbook-ui
  namespace: app-dev
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: external 
    service.beta.kubernetes.io/aws-load-balancer-scheme: internet-facing
    service.beta.kubernetes.io/aws-load-balancer-nlb-target-type: ip
spec:
  type: LoadBalancer	
  ports:	
  - port: 80	
    targetPort: 80
    protocol: TCP
  selector:	
    app: guestbook-ui
```
Chạy command sau đây để tạo Deployment và Service:
```
cd ./k8s
kubectl apply -k ./base
```
Để theo dõi cách mà Pod được chạy trên Fargate, sử dụng command sau, và xem phần Events:
```
kubectl describe pod -n app-dev -l fargate=yes
Events:
  Type     Reason           Age   From               Message
  ----     ------           ----  ----               -------
  Warning  LoggingDisabled  102s  fargate-scheduler  Disabled logging because aws-logging configmap was not found. configmap "aws-logging" not found
  Normal   Scheduled        51s   fargate-scheduler  Successfully assigned app-dev/guestbook-ui-b595bd5d8-7hbjm to fargate-ip-192-168-118-178.ap-southeast-1.compute.internal
  Normal   Pulling          51s   kubelet            Pulling image "gcr.io/heptio-images/ks-guestbook-demo:0.1"
  Normal   Pulled           33s   kubelet            Successfully pulled image "gcr.io/heptio-images/ks-guestbook-demo:0.1" in 18.052091807s (18.052104843s including waiting)
  Normal   Created          32s   kubelet            Created container guestbook-ui
  Normal   Started          32s   kubelet            Started container guestbook-ui
```

Lấy thông tin node Fargate được chạy bằng 2 command sau:
```
NODE_NAME=$(kubectl get pod -n checkout -l app=guestbook-ui -o json | jq -r '.items[0].spec.nodeName')
kubectl describe node $NODE_NAME
```
Dưới đây là mẫu thông tin của một Fargate Node:
![Fargate](/images/3-fargate/node-fargate.png)
Lấy thông tin IP của Load Balancer:
```
kubectl get svc -n app-dev
NAME           TYPE           CLUSTER-IP       EXTERNAL-IP                     PORT(S)        AGE
guestbook-ui   LoadBalancer   10.100.246.236   <YOUR_NLB_DNS>                  80:32137/TCP   2m53s
```
Truy cập vào địa chỉ DNS của Load Balancer trên browser để xem ứng dụng được chạy trên Fargate.
![Fargate](/images/3-fargate/nlb-dns.png)
**Hooray!** chúng ta đã deploy ứng dụng trong Fargate thành công.
