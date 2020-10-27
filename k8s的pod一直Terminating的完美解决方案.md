```
# kubectl get po -n mon
NAME                                  READY   STATUS        RESTARTS   AGE
alertmanager-d6ccb787b-4bvhx          1/1     Running       0          17h
grafana-64855ff589-8ttkt              0/1     Terminating   0          17h
grafana-677c547cf8-gd5d4              1/1     Running       0          17h
kube-state-metrics-6d7449fc78-5rpmn   1/1     Running       0          19d
node-exporter-5zs2r                   1/1     Running       0          17h
node-exporter-wcct6                   1/1     Running       0          17h
prometheus-b85bc99bd-8l6q2            1/1     Running       0          15h
```
上述的grafana-64855ff589-8ttkt pod 已经处于Terminating状态 17个小时了，依旧没有删除掉

这种情况下可以使用强制删除命令
```
# kubectl delete pod grafana-64855ff589-8ttkt  --force --grace-period=0 -n mon
warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "grafana-64855ff589-8ttkt" force deleted
```

注意：必须加-n参数指明namespace，否则可能报错pod not found。

查看
```
kubectl get po -n mon
NAME                                  READY   STATUS    RESTARTS   AGE
alertmanager-d6ccb787b-4bvhx          1/1     Running   0          17h
grafana-677c547cf8-gd5d4              1/1     Running   0          17h
kube-state-metrics-6d7449fc78-5rpmn   1/1     Running   0          19d
node-exporter-5zs2r                   1/1     Running   0          17h
node-exporter-wcct6                   1/1     Running   0          17h
prometheus-b85bc99bd-8l6q2            1/1     Running   0          16h
```
强制删除完毕
