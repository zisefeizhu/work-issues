## 安装Let’s Encrypt
安装非常简单直接克隆就可以了
```
# git clone https://github.com.cnpmjs.org/letsencrypt/letsencrypt
# cd letsencrypt/
# ll
```
## 生成通配符证书
期间需要根据提示设置DNS TXT记录,用作你对判断你是否拥有域名使用权
```
./certbot-auto certonly  -d   *.zisefeizhu.com --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
```

| 参数 | 说明 | 
| :-----| :---- |
| certonly | 表示安装模式，Certbot 有安装模式和验证模式两种类型的插件 |
| –manual | 表示手动安装插件，Certbot 有很多插件，不同的插件都可以申请证书，用户可以根据需要自行选择 |
| -d | 为那些主机申请证书，如果是通配符，输入 *.leixf.cn（可以替换为你自己的一级域名） |
| –preferred-challenges dns | 使用 DNS 方式校验域名所有权 |
| –server | Let’s Encrypt ACME v2 版本使用的服务器不同于 v1 版本，需要显示指定 |

输出结果
```
作为依赖被升级:
  cpp.x86_64 0:4.8.5-44.el7            e2fsprogs.x86_64 0:1.42.9-19.el7 e2fsprogs-libs.x86_64 0:1.42.9-19.el7 krb5-libs.x86_64 0:1.15.1-50.el7 libcom_err.x86_64 0:1.42.9-19.el7
  libffi.x86_64 0:3.0.13-19.el7        libgcc.x86_64 0:4.8.5-44.el7     libgomp.x86_64 0:4.8.5-44.el7         libselinux.x86_64 0:2.5-15.el7   libselinux-python.x86_64 0:2.5-15.el7
  libselinux-utils.x86_64 0:2.5-15.el7 libss.x86_64 0:1.42.9-19.el7     openssl-libs.x86_64 1:1.0.2k-19.el7   python.x86_64 0:2.7.5-90.el7     python-libs.x86_64 0:2.7.5-90.el7

完毕！
Creating virtual environment...
Installing Python packages...
Installation succeeded.
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator manual, Installer None
Enter email address (used for urgent renewal and security notices)
```
接下来需要按要求输入指令
```
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator manual, Installer None
Enter email address (used for urgent renewal and security notices)
 (Enter 'c' to cancel): linkun@zisefeizhu.com

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at
https://acme-v02.api.letsencrypt.org/directory
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(A)gree/(C)ancel: A

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing, once your first certificate is successfully issued, to
share your email address with the Electronic Frontier Foundation, a founding
partner of the Let's Encrypt project and the non-profit organization that
develops Certbot? We'd like to send you email about our work encrypting the web,
EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: N
Obtaining a new certificate
Performing the following challenges:
dns-01 challenge for zisefeizhu.com

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTE: The IP of this machine will be publicly logged as having requested this
certificate. If you're running certbot in manual mode on a machine that is not
your server, please ensure you're okay with that.

Are you OK with your IP being logged?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: Y

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please deploy a DNS TXT record under the name
_acme-challenge.zisefeizhu.com with the following value:

JM-pzw0Cf7GKfqu_2tyIA-rmfWptxabEFPEP5gSlLEQ

Before continuing, verify the record is deployed.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
```
这里有几个需交互的提示
> - 是否同意 Let’s Encrypt 协议要求=>需要同意
> - 是否分享你的邮箱
> - 询问是否对域名和机器（IP）进行绑定=>需要同意

需要注意的地方：
```
Please deploy a DNS TXT record under the name
_acme-challenge.zisefeizhu.com with the following value:

JM-pzw0Cf7GKfqu_2tyIA-rmfWptxabEFPEP5gSlLEQ

Before continuing, verify the record is deployed.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
```
要求配置 DNS TXT 记录，从而校验域名所有权，也就是判断证书申请者是否有域名的所有权。

上面输出要求给 _acme-challenge.leixf.cn 配置一条 TXT 记录，在没有确认 TXT 记录生效之前不要回车执行。

我用的是阿里云的域名服务器，控制台具体操作如下所示：
云解析DNS --> 域名解析 --> 解析设置 --> 记录类型(TXT) --> 主机记录(_acme-challenge) --> 解析线路(默认) --> 记录值(JM-pzw0Cf7GKfqu_2tyIA-rmfWptxabEFPEP5gSlLEQ) 



确认生效
```
 dig _acme-challenge.zisefeizhu.com

; <<>> DiG 9.10.6 <<>> _acme-challenge.zisefeizhu.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 4648
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;_acme-challenge.zisefeizhu.com.  IN      A

;; AUTHORITY SECTION:
zisefeizhu.com.           600     IN      SOA     dns25.hichina.com. hostmaster.hichina.com. 2019121120 3600 1200 86400 360

;; Query time: 265 msec
;; SERVER: 192.168.0.1#53(192.168.0.1)
;; WHEN: Mon Nov 23 10:51:21 CST 2020
;; MSG SIZE  rcvd: 118
```

回车执行，输出如下
```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/zisefeizhu.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/zisefeizhu.com/privkey.pem
   Your cert will expire on 2021-02-21. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot-auto
   again. To non-interactively renew *all* of your certificates, run
   "certbot-auto renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```
看到这个界面内容的话，证书安装成功了。

查看证书过期时间
```
# ./certbot-auto certificates
Certificate Name: zisefeizhu.com
    Serial Number: 3041ed1be0505aaa20c9c192744c3ed28f3
    Domains: *.zisefeizhu.com
    Expiry Date: 2021-02-21 01:55:54+00:00 (VALID: 89 days)
    Certificate Path: /etc/letsencrypt/live/zisefeizhu.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/zisefeizhu.com/privkey.pem
```

验证
```
# yum install nginx

```


取消证书
可以使用一下命令取消刚刚生成的密匙，也就是以上的反操作：
```
certbot revoke --cert-path /etc/letsencrypt/live/leixf.cn/cert.pem
certbot delete --cert-name leixf.cn

```


证书路径：
```
/etc/letsencrypt/live/zisefeizhu.com/
```

## k8s使用
![](https://cdn.nlark.com/yuque/0/2020/png/1143489/1606458261252-1f84b293-e900-44cd-9f84-c0cf89a12c89.png)
tls.crt --> /etc/letsencrypt/live/zisefeizhu.com/fullchain.pem

tls.key --> /etc/letsencrypt/live/zisefeizhu.com/privkey.pem

crt.sh
```
kubectl create secret tls zisefeizhu-cn-crt --key tls.key --cert tls.crt -n zisefeizhu
```
nginx-ingress.yaml
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: nginx-test
  namespace: realihub
  annotations:
    kubernetes.io/ingress.class: "kong"
  labels:
    app: nginx-test
spec:
  tls:
    - hosts:
        - "*.zisefeizhu.com"
      secretName: hub-zisefeizhu-com-crt
  rules:
    - host: test.zisefeizhu.com
      http:
        paths:
          - path: /
            backend:
              serviceName: nginx-test
              servicePort: 80
```




参考文档：
https://github.com/jaywcjlove/handbook/blob/master/CentOS/使用免费SSL证书让网站支持HTTPS访问.md

https://leixf.cn/archives/142


 ./certbot-auto certonly  -d   *.zisefeizhu.com --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
 
./certbot-auto certonly  -d   *.realihub.com --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
 
dig -t txt _acme-challenge.realibox.cn  @8.8.8.8 

