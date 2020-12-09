### 由kubed引起的心电图

#### 问题源
突然收到持续告警邮件，报告k8s集群节点持续异常
![](https://cdn.nlark.com/yuque/0/2020/png/1143489/1607503601654-c3e2ce85-3d34-4d88-9db7-c6fa9ecd1b26.png)
大致内容如下：
![](https://cdn.nlark.com/yuque/0/2020/png/1143489/1607503789542-4e8cf6f2-cb74-4464-b341-aea2145db96f.png)
有一个固定的k8s节点在持续的进行告警，且都是cpu使用率过高。

查看监控平台
![](https://cdn.nlark.com/yuque/0/2020/png/1143489/1607503936329-b68e0576-46ae-4eda-9150-8e03472f5663.png)

大致确定引起cpu过高的原因是磁盘iops跑高，为什么会跑高呢？

#### 排查原因
1、通过跳板机登陆该节点

2、安装iotop命令

3、查看是那条命令引起的异常
```
# iotop
......
1224060 be/4 65535	 0.00 B/s  310.79 K/s  0.00 %  99.8 % kubed run --v=3 --secure-port=8443 -~for-aks=true --enable-analytics=true
 122883 be
```
经过观察是有kubed引起的。

#### 解决问题
kubed 是什么？ 通过艰难查询，只能得到如下网上信息

> - Kubed（发音为“Cube-dee”），是由针对容器应用开发的协同编码平台供应商 AppsCode 开发的一个 Kubernetes 群集运算符守护进程。

功能特性：
> - Kubed 可定期对 Kubernetes 集群对象进行快照。
> - Kubed 为已删除和已更新的 Kubernetes 对象提供临时存储站。
> - Kubed 可在命名空间中保持 ConfigMaps 和 Secrets 同步。
> - Kubed 可将群集事件转发到各个目标。
> - Kubed 可为 Elasticsearch 和 InfluxDB 设置管理员。
> - Kubed 可通过电子邮件、短信或聊天方式发送通知。
> - Kubed 内置搜索引擎，用于使用 bleve 的集群对象。

那么我司的生产环境为何存在此组建呢？ 通过查询有关历史可以得到如下信息：
> - 借鉴来源：https://rimusz.net/lets-encrypt-wildcard-certs-in-kubernetes
```
在不同namespace同步证书
helm repo add appscode https://charts.appscode.com/stable/
helm repo update
kubectl --namespace=kube-system get deployments -l "release=kubed, app=kubed"\n
kubectl annotate secret realibox-com-crt -n cert-manager kubed.appscode.com/sync="app=kubed"

kubectl label namespace default app=kubed
kubectl -n default get secret realibox-com-crt
```
行吧，同上上述，此组件是非必须项。既然是由此组件引起，那么可删。

我司集群已经存在500余天，为何在最近由引起cpu异常呢？
```
# ctl get po -n kube-system  | grep  kubed
kubed-kubed-84d4498ffb-5b2gj                       1/1     Running            0          12d
```
12d ,最近12天创建？ 那么是因为12天前发生pod重建还是12天前被激活呢？不是很注意到此问题。
```
# ctl get deployment kubed-kubed -n kube-system
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
kubed-kubed   1/1     1            1           425d
```
此组件在线上已经存在425d, 最近却暴露出问题，有点不解。

解决
```
（1）找个业务低峰期，看看这个pod是调度到哪个节点上面了，然后把节点做个快照备份
（2）然后再把对应deploy 的 replica置为0吧，观察一段时间，没问题再删除deployment。
```
