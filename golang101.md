### golang101

经过一段时间的验证，此书在不断更新中，值得跟随学习，特分享给道友

github地址：https://github.com/golang101/golang101.git

### 部署

#### 安装
在个人的云服务器部署，方便在随时随地查看
```
运行

# git clone https://github.com.cnpmjs.org/golang101/golang101.git
更新

进入本书项目目录（包含当前README.md文件的目录），然后运行：

# git pull
本地阅读本书

进入本书项目目录（包含当前README.md文件的目录），然后运行：

# go run . &     #后台执行
Server started:
   http://localhost:12345 (non-cached version)
   http://127.0.0.1:12345 (cached version)
```

#### 同步
因为本书在不断更新中，便于时刻更新，我做了一个简单的定时更新
```
# crontab -l
## golang101
0 0  * * 0  cd /root/tools/golang101 && git pull && go run . &
```



