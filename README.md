# rap2-docker
docker部署淘宝rap2服务

## 运行

```
> docker-compose up -d

Creating network "rap2-docker_default" with the default driver
Creating rap2-redis   ... done
Creating rap2-dolores ... done
Creating rap2-mysql   ... done
Creating rap2-delos   ... done

> docker ps -a

CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                                                NAMES
b2b85cf86cbd        blackdog1987/rap2-delos:1.0.0   "/bin/sh -c 'sleep 3…"   5 seconds ago       Up 5 seconds        0.0.0.0:38080->8080/tcp                              rap2-delos
6afe23ddddfb        mysql:5.7.22                    "docker-entrypoint.s…"   7 seconds ago       Up 5 seconds        0.0.0.0:33306->3306/tcp                              rap2-mysql
c04f47290fb0        redis:4.0.9                     "docker-entrypoint.s…"   7 seconds ago       Up 5 seconds        6379/tcp                                             rap2-redis
e377a4d9835c        rynxiao/rap2:1.0.0              "/bin/sh -c 'nginx -…"   7 seconds ago       Up 6 seconds        0.0.0.0:38081->80/tcp                                rap2-dolores

# 这步也可以不执行，可以稍微等一会，因为需要初始化数据库脚本
# 否则最开始在浏览器中打开会报错

> docker exec -it rap2-delos sh
> node scripts/init
> exit
> docker-compose down
> docker-compose up -d
```

## 预览

```
http://localhost:38081
```

更多请看文章[教你使用docker部署淘宝rap2服务](https://www.cnblogs.com/rynxiao/p/9080179.html)
