### k8s 删除节点

线上环境
```
# ctl get nodes
NAME                       STATUS   ROLES    AGE    VERSION
cn-shenzhen.172.16.0.123   Ready    <none>   104d   v1.16.9-aliyun.1
cn-shenzhen.172.16.0.154   Ready    <none>   11d    v1.16.9-aliyun.1
cn-shenzhen.172.16.0.155   Ready    <none>   11d    v1.16.9-aliyun.1
cn-shenzhen.172.16.0.157   Ready    <none>   116s   v1.16.9-aliyun.1
#  ctl cordon cn-shenzhen.172.16.0.155
node/cn-shenzhen.172.16.0.155 cordoned
# ctl get pod

# ctl drain --ignore-daemonsets cn-shenzhen.172.16.0.155
node/cn-shenzhen.172.16.0.155 already cordoned
error: unable to drain node "cn-shenzhen.172.16.0.155", aborting command...

There are pending nodes to be drained:
 cn-shenzhen.172.16.0.155
error: cannot delete Pods with local storage (use --delete-local-data to override): gitlab-runner/gitlab-runner-gitlab-runner-c669795b4-4p6kp, gitlab-runner/gitlab-runner-gitlab-runner-c669795b4-kscgx, istio-system/grafana-95d4f8f58-zpvvg, istio-system/jaeger-7d656bc7c6-z7v4m, istio-system/prometheus-6d87d85c88-vwrqt

# ctl drain --ignore-daemonsets --delete-local-data  cn-shenzhen.172.16.0.155


# ctl delete node cn-shenzhen.172.16.0.155
node "cn-shenzhen.172.16.0.155" deleted
```
