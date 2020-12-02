多集群的切换是K8s运维中比不可少的问题，常见的基于多个集群进行切换的方法有三种：

- 切换config文件
- 通过context进行集群切换
- 用kubecm进行集群切换

## 切换config文件



我们先看看放在`.kube`下默认的config集群：



```
$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: 
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: "2xxxxxxxxx7"
  name: 2xxxxxxxxxxxxxxxx8
current-context: 2xxxxxxxxxxxx8
kind: Config
preferences: {}
users:
- name: "2xxxxxxxxxxx27"
  user:
    client-certificate-data: 
    client-key-data:
```



通过`export`更改默认集群配置：



```
$ export  KUBECONFIG=$HOME/.kube/rancher-config
```



查看：



```
$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: 
  name: stage
contexts:
- context:
    cluster: stage
    user: stage
  name: stage
current-context: stage
kind: Config
preferences: {}
users:
- name: stage
  user:
    token:
```



这种方法就是特别麻烦，每次切换都要通过export设置，非常麻烦，同时也不方便。



## 通过context进行集群切换



把要切换的**所有config**文件添加到`KUBECONFIG`环境变量中



```
$ export  KUBECONFIG=$HOME/.kube/config:$HOME/.kube/rancher-config
```



或者可以将命令直接写到`.bashrc`文件中，这样就不需要每次手动设置。



通过`kubectl config view`可以看到这两个文件已经合并到一起了：



```
$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: 
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: "2xxxxxxxxx7"
  name: 2xxxxxxxxxxxxxxxx8
current-context: 2xxxxxxxxxxxx8
kind: Config
preferences: {}
users:
- name: "2xxxxxxxxxxx27"
  user:
    client-certificate-data: 
    client-key-data:
```



合并一起后就可以通过`use-context`切换上下文来切换集群：



```
# 切换stage集群
$ kubectl config use-context stage
Switched to context "stage".
```



切换到第二个集群：



```
$ kubectl config use-context 2xxxxxxxxxxx8
Switched to context "21xxxxxxxxxxxxx9648".
```



但这种方法不方便的地方就在如果context很多的时候，不方便查看。



## 用kubecm进行集群切换

#### 安装篇

基础环境



mac

k8s 1.16.9



```
# wget https://github.com.cnpmjs.org/sunny0826/kubecm/releases/download/v0.10.3/kubecm_0.10.3_Darwin_x86_64.tar.gz
# tar xf kubecm_0.10.3_Darwin_x86_64.tar.gz
# mv kubecm /usr/local/bin
# kubecm --help

KubeConfig Manager
_          _
| | ___   _| |__   ___  ___ _ __ ___
| |/ / | | | '_ \ / _ \/ __| '_ \ _ \
|   <| |_| | |_) |  __/ (__| | | | | |
|_|\_\\__,_|_.__/ \___|\___|_| |_| |_|

Find more information at: https://github.com/sunny0826/kubecm

Usage:
kubecm [command]

Available Commands:
add         Merge configuration file with $HOME/.kube/config
alias       Generate alias for all contexts
completion  Generates bash/zsh completion scripts
delete      Delete the specified context from the kubeconfig
help        Help about any command
ls          List kubeconfig
merge       Merge the kubeconfig files in the specified directory
namespace   Switch or change namespace interactively
rename      Rename the contexts of kubeconfig
switch      Switch Kube Context interactively
version     Print version info

Flags:
    --config string   path of kubeconfig (default "/var/root/.kube/config")
-h, --help            help for kubecm

Use "kubecm [command] --help" for more information about a command.
```

 #### 补全 

bash



```
# ource <(kubecm completion bash)
# echo "source <(kubecm completion bash)" >> ~/.bashrc
# source  ~/.bashrc
```



zsh



```
# source <(kubecm completion zsh)
# echo "source <(kubecm completion zsh)" >> ~/.zshrc
# source  ~/.zshrc
```

#### 基本使用



查看



```
# kubecm ls
+------------+-----------------------------------+---------------+-----------------------+--------------------------------+--------------+
|   CURRENT  |                NAME               |    CLUSTER    |          USER         |             SERVER             |   Namespace  |
+============+===================================+===============+=======================+================================+==============+
|      *     |   283387751775489594-c02e82b6ada  |   kubernetes  |   283387751775489594  |   https://3.3.3.3:6443  |    default   |
|            |       f044bd94d251fea1279648      |               |                       |                                |              |
+------------+-----------------------------------+---------------+-----------------------+--------------------------------+--------------+

Cluster check succeeded!
Kubernetes master is running at https://3.3.3.3:6443
Contains components: [scheduler controller-manager etcd-5 etcd-0 etcd-4 etcd-1 etcd-3 etcd-2]
```



添加



```
# ll
-rw-r--r--    1 root  wheel   5.9K  8 26 15:39 config.shengchan
-rw-r--r--    1 root  wheel   5.9K 11 18 15:59 config.yufa

# kubecm add -f config.yufa -c -n stage
# kubecm add -f config.shengchan -c -n production
#  kubecm ls
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+
|   CURRENT  |      NAME     |        CLUSTER        |        USER        |             SERVER             |   Namespace  |
+============+===============+=======================+====================+================================+==============+
|      *     |   production  |   cluster-kg7h48f8tb  |   user-kg7h48f8tb  |   https://3.3.3.3:6443  |    default   |
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+
|            |     stage     |   cluster-kfc6fbfcdt  |   user-kfc6fbfcdt  |   https://4.4.4.4:6443  |    default   |
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+
```



删除



```
# kubecm delete
😸 Select:production
👻 True
Context Delete:「production」
「/var/root/.kube/config」 write successful!
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+
|   CURRENT  |      NAME     |        CLUSTER        |        USER        |             SERVER             |   Namespace  |
+============+===============+=======================+====================+================================+==============+
|     *      |     stage     |   cluster-kfc6fbfcdt  |   user-kfc6fbfcdt  |   https://4.4.4.4:6443  |    default   |
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+
```



切换



```
# kubecm switch
😸 Select:production
「/var/root/.kube/config」 write successful!
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+
|   CURRENT  |      NAME     |        CLUSTER        |        USER        |             SERVER             |   Namespace  |
+============+===============+=======================+====================+================================+==============+
|      *     |   production  |   cluster-kg7h48f8tb  |   user-kg7h48f8tb  |   https://3.3.3.3:6443  |    default   |
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+
|            |     stage     |   cluster-kfc6fbfcdt  |   user-kfc6fbfcdt  |   https://4.4.4.4:6443  |    default   |
+------------+---------------+-----------------------+--------------------+--------------------------------+--------------+

Switched to context 「production」
```

