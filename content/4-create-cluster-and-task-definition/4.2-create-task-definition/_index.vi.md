---
title : "Tạo Task Definition"
date :  "`r Sys.Date()`" 
weight : 2
chapter : false
pre : " <b> 4.2 </b> "
---
#### Create Task Definition
1. Ở cửa sổ của ECS nhấn chọn **Task definitions** bên thanh menu
![Create Task Definition](/images/4-create-cluster-and-task-definition/4.2-create-task-definition/001.png)
2. Ở cửa sổ của Task definition, nhấn chọn **Create new task definition**, chọn option thứ nhất
![Create Task Definition](/images/4-create-cluster-and-task-definition/4.2-create-task-definition/002.png)
3. Ở phần configure task definition and container 
    - Điền tên của task definition vào **Task definition family**, ví dụ ```ecs_cluster_td```
    - Ở phần **Container**, điền tên cho container tại **Name**, copy URI image đã push lên ECR ở bước 3 vào **Image URI**
    - **Container port**, nhập vào 8080, **Protocol** là TCP
    - Nhấn Next để sang bước tiếp theo
![Create Task Definition](/images/4-create-cluster-and-task-definition/4.2-create-task-definition/003.png)
4. Ở phần configure environment, storage, monitoring, and tags
    - **App environment** nhấn chọn **AWS serverless**
    - **Task size** nhấn chọn .25vCPU, .5GB Memory để tiết kiệm chi phí
    - Task execution role, chọn **ecsTaskExecutionRole**
    - Nhấn Next để sang bước tiếp theo 
![Create Task Definition](/images/4-create-cluster-and-task-definition/4.2-create-task-definition/004.png)
5. Ở phần Review and create
    - Kiểm tra lại thông tin và nhấn **Create** để tạo **Task definition**
![Create Task Definition](/images/4-create-cluster-and-task-definition/4.2-create-task-definition/005.png)
6. Dưới đây là kết quả
![Create Task Definition](/images/4-create-cluster-and-task-definition/4.2-create-task-definition/006.png)