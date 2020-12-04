### 3号机清理脚本

#### 目标：
简单粗暴点，安全高效点
#### 思路
既然占用的是云盘，既然是因为缓存引起的，既然可以直接全部清除

目录：/tmp/realicloud-open/oss/cache

/home/deploy/scripts/clean-oss-cache.sh


```
#!/bin/sh

# 判断磁盘容量
hoststorage=`df -h | grep  -w /dev/vda1  | awk '{print $5}'| tr -cd "[0-9]"`

# 大于90，清空缓存
if [ $hoststorage -gt 90 ]; then
    rm -rf /tmp/realicloud-open/oss/cache/*
fi
```