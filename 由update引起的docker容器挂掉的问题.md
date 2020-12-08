### 一次yum install -y update 引起的Error response from daemon: OCI runtime create failed: container with id exists问题

```
# yum install update -y

# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
> - 所有的docker 进程挂掉

重启容器
```
# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                        PORTS                    NAMES
d44095fffbb3        minio/minio         "/usr/bin/docker-ent…"   3 months ago        Exited (128) 19 minutes ago   0.0.0.0:9000->9000/tcp   minio

# docker start d44095fffbb3
Error response from daemon: OCI runtime create failed: container with id exists: d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2: unknown
```

查看docker版本
```
# docker info
....
 Server Version: 19.03.14
....
```
> - 由18.4 升级为19.03.14


解决问题
```
# find / -name "d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2"
/run/docker/runtime-runc/moby/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/run/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/devices/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/freezer/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/cpu,cpuacct/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/memory/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/hugetlb/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/cpuset/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/perf_event/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/net_cls,net_prio/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/blkio/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/pids/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/sys/fs/cgroup/systemd/docker/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/data/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/data/docker/image/overlay2/layerdb/mounts/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
/data/docker/containers/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
```
删除如下文件
```
# rm -rf /run/docker/runtime-runc/moby/d44095fffbb385fb2c2fc5ad1522adc2b72cc7d42d5db5f7f4b5bdddead699f2
```
重启容器
```
# docker start d44095fffbb3
d44095fffbb3
```
查看结构
```
# docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
d44095fffbb3        minio/minio         "/usr/bin/docker-ent…"   3 months ago        Up 1 second         0.0.0.0:9000->9000/tcp   minio
```



