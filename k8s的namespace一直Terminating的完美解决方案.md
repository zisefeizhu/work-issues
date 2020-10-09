## k8s的namespace一直Terminating的完美解决方案

在k8s集群中进行测试删除namespace是经常的事件，而为了方便操作，一般都是直接对整个名称空间进行删除操作。
相信道友们在进行此步操作的时候，会遇到要删除的namespace一直处于Terminating。下面我将给出一个完美的解决方案，

## 测试demo
```
创建demo namespace
# kubectl create ns test
namespace/test created

删除demo namespace
# kubectl delete ns test
namespace "test" deleted

一直处于deleted不见exit
查看状态 可见test namespace 处于Terminating  
# kubectl get ns -w
NAME                STATUS        AGE
test                Terminating   18s
```

### 下面给出一种完美的解决方案：调用接口删除
```
开启一个代理终端
# kubectl proxy
Starting to serve on 127.0.0.1:8001

再开启一个操作终端
将test namespace的配置文件输出保存
# kubectl get ns test -o json > test.json
删除spec及status部分的内容还有metadata字段后的","号，切记！
剩下内容大致如下
{
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
        "annotations": {
            "cattle.io/status": "{\"Conditions\":[{\"Type\":\"ResourceQuotaInit\",\"Status\":\"True\",\"Message\":\"\",\"LastUpdateTime\":\"2020-10-09T07:12:17Z\"},{\"Type\":\"InitialRolesPopulated\",\"Status\":\"True\",\"Message\":\"\",\"LastUpdateTime\":\"2020-10-09T07:12:18Z\"}]}",
            "lifecycle.cattle.io/create.namespace-auth": "true"
        },
        "creationTimestamp": "2020-10-09T07:12:16Z",
        "deletionTimestamp": "2020-10-09T07:12:22Z",
        "name": "test",
        "resourceVersion": "471648079",
        "selfLink": "/api/v1/namespaces/test",
        "uid": "862d311e-d87a-48c2-bc48-332a4db9dbdb"
    }
}

调接口删除
# curl -k -H "Content-Type: application/json" -X PUT --data-binary @test.json http://127.0.0.1:8001/api/v1/namespaces/test/finalize
{
  "kind": "Namespace",
  "apiVersion": "v1",
  "metadata": {
    "name": "test",
    "selfLink": "/api/v1/namespaces/test/finalize",
    "uid": "862d311e-d87a-48c2-bc48-332a4db9dbdb",
    "resourceVersion": "471648079",
    "creationTimestamp": "2020-10-09T07:12:16Z",
    "deletionTimestamp": "2020-10-09T07:12:22Z",
    "annotations": {
      "cattle.io/status": "{\"Conditions\":[{\"Type\":\"ResourceQuotaInit\",\"Status\":\"True\",\"Message\":\"\",\"LastUpdateTime\":\"2020-10-09T07:12:17Z\"},{\"Type\":\"InitialRolesPopulated\",\"Status\":\"True\",\"Message\":\"\",\"LastUpdateTime\":\"2020-10-09T07:12:18Z\"}]}",
      "lifecycle.cattle.io/create.namespace-auth": "true"
    }
  },
  "spec": {

  },
  "status": {
    "phase": "Terminating",
    "conditions": [
      {
        "type": "NamespaceDeletionDiscoveryFailure",
        "status": "True",
        "lastTransitionTime": "2020-10-09T07:12:27Z",
        "reason": "DiscoveryFailed",
        "message": "Discovery failed for some groups, 1 failing: unable to retrieve the complete list of server APIs: metrics.k8s.io/v1beta1: the server is currently unable to handle the request"
      },
      {
        "type": "NamespaceDeletionGroupVersionParsingFailure",
        "status": "False",
        "lastTransitionTime": "2020-10-09T07:12:28Z",
        "reason": "ParsedGroupVersions",
        "message": "All legacy kube types successfully parsed"
      },
      {
        "type": "NamespaceDeletionContentFailure",
        "status": "False",
        "lastTransitionTime": "2020-10-09T07:12:28Z",
        "reason": "ContentDeleted",
        "message": "All content successfully deleted"
      }
    ]
  }
}
```
### 查看结果
```
1、delete 状态终止
kubectl delete ns test
namespace "test" deleted

2、Terminating状态终止
kubectl get ns -w
test                Terminating   18s
test                Terminating   17m
```
名称空间被删除掉
 
