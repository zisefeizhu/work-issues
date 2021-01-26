### 安装pg

docker run --name my_postgres3 -v pgdata:/var/lib/postgresql/data3 -e POSTGRES_PASSWORD=Realibox2018 -p 7432:5432 -d postgres:11.8 -c max_connections=200   #postgres

### 安装mongodb
docker run --name my_mongo1 -p 37017:27017 -v /data/mongodb1/data:/data/db -v /data/mongodb1/backup:/data/backup -d mongo

> - https://www.cnblogs.com/smiler/p/10112676.html


### 安装mysql
docker run -p 3306:3306 -d --name mymysql -v /docker/mysql/data:/usr/share/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.5

### 安装reds
docker run -p 6379:6379 -d --name myredis -v /docker/redis/data:/data redis:3.2 redis-server --appendonly yes --requirepass zisefeizhu

> - https://www.cnblogs.com/codehui/p/docker_mysql_redis.html




docker run --name my_mongo_business -p 47017:27017 -v /data/my_mongo_business/data:/data/db -v /data/my_mongo_business/backup:/data/backup -d mongo





