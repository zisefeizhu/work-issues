### 前言

因为我司有多套k8s环境，管理起来过于麻烦，需要一个统一的管理平台，又因为没有预留时间自己开发，经过选择后，使用rancher来进行多k8s环境的统一管理平台。

### 部署

1、在阿里云上申请免费的证书

![image.png](https://cdn.nlark.com/yuque/0/2020/png/1143489/1598844853200-40890e5f-cb06-464e-8869-2695815f19cc.png)

2、下载到节点服务器

```
# ll
-rw-r--r--  1 root root 1675 Aug 17 14:27 4366172_kuxxxx.rxxxox.cn.key
-rw-r--r--  1 root root 4051 Aug 17 14:27 4366172_kuxxxx.rxxxox.cn_other.zip
-rw-r--r--  1 root root 3675 Aug 17 14:27 4366172_kuxxxx.rxxxox.cn.pem
```

3、启动rancher 镜像

```
# docker run -d --restart=unless-stopped   -p 80:80 -p 443:443 -e AUDIT_LEVEL=3   -v /root/linkun/4366172_kuxxxx.rxxxox.cn.pem:/etc/rancher/ssl/cert.pem  -v /root/linkun/4366172_kuxxxx.rxxxox.cn.key:/etc/rancher/ssl/key.pem   rancher/rancher:latest --no-cacerts
e9fec97152bd560e8506f36aeb8be7191f03bd3cb522a630495be2ff996e6d58

# docker ps
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS                                      NAMES
e9fec97152bd        rancher/rancher:latest   "entrypoint.sh --no-…"   3 seconds ago       Up 2 seconds        0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   blissful_bhaskara
```

4、浏览器访问

![image.png](https://cdn.nlark.com/yuque/0/2020/png/1143489/1598845161735-b7874b2c-5837-4a72-9bb7-8316eddfb876.png)

🆗！rancher的ssl部署完成

