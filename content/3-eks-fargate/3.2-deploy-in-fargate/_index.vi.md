---
title : "Deploy ứng dụng trong Fargate"
date :  "`r Sys.Date()`" 
weight : 2
chapter : false
pre : " <b> 3.2 </b> "
---
Trong phần này chũng ta sẽ tạo 2 object là Deployment và Service để deploy ứng dụng trong Fargate. Deployment sẽ tạo ra 1 Pod chạy ứng dụng. Service sẽ tạo ra một load balancer để truy cập vào ứng dụng.

Đây là file configure cho Deployment và Service:
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
spec:	
  type: LoadBalancer
  ports:	
  - port: 80	
    targetPort: 80	
  selector:	
    app: guestbook-ui
```
Chạy command sau đây để tạo Deployment và Service:
```
kubectl apply -k ./app
```
Để theo dõi cách mà Pod được chạy trên Fargate, sử dụng command sau, và xem phần Events:
```
kubectl describe pod -n app-dev -l fargate=yes
```

Lấy thông tin node Fargate được chạy bằng 2 command sau:
```
NODE_NAME=$(kubectl get pod -n checkout -l app.kubernetes.io/component=service -o json | jq -r '.items[0].spec.nodeName')
kubectl describe node $NODE_NAME
```