FROM centos:7
ENV NGINX_VERSION 1.9.9
RUN \
    /bin/cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	yum install -y wget telnet && \
    yum install -y gcc zlib zlib-devel pcre-devel openssl openssl-devel && \
    yum install -y postgresql-server && \
	yum clean all && \
	cd /tmp && \
	wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
	tar -zxvf nginx-1.9.9.tar.gz && \
	/bin/rm -rf nginx-1.9.9.tar.gz && \
	cd nginx-${NGINX_VERSION} && \
	./configure --prefix=/usr/local/nginx && \
	make && \
	make install && \
	cd /tmp && \
	rm -rf /tmp/nginx-${NGINX_VERSION} && \
	true

EXPOSE 80
CMD [ "/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]



registry.cn-shenzhen.aliyuncs.com/realibox/static-resource-nginx-service:stage-business-5802