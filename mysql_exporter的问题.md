### 问题描述
在使用prometheus监控mysql服务时，使用到了mysql_exporter，一直运行稳定，在mysql中加入``skip-name-resolve``参数后出现一下问题：
![](https://cdn.nlark.com/yuque/0/2021/png/1143489/1610963354347-654d0161-17df-4182-bfa7-0dc790337bb4.png)
> - 为啥这个主机被解析成了::1了呢？而不是localhost?这个mysql服务我加了一个skip-name-resolv的参数后就这样了

### 解决问题

查阅``skip-name-resolve``的有关资料
![](https://cdn.nlark.com/yuque/0/2021/png/1143489/1610963459270-23852b4c-3c26-4c33-84ca-80889d30587e.png)
草了，mysql为安全考虑不应该是localhost吗

关于skip_name_resolve参数的总结-iVictor-博客园
https://www.cnblogs.com/ivictor/p/5311607.html

### 解决
![](https://cdn.nlark.com/yuque/0/2021/png/1143489/1610963518698-b2ce610a-fd2f-4873-98b1-efea7e47365d.png)
> - ipv6

把ipv6协议栈关了 就ok了

