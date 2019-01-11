# rap2-docker
Run rap2 server locally by docker-compose way

## Run

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
e377a4d9835c        rynxiao/rap2:1.0.1              "/bin/sh -c 'nginx -…"   7 seconds ago       Up 6 seconds        0.0.0.0:38081->80/tcp                                rap2-dolores

# [This step can be omitted]
# Just wait a moment or run the "node script/init" command in the container manually&immediately
# To initialize the database
# Otherwise it should be an error when you open the browser

> docker exec -it rap2-delos sh
> node scripts/init
> exit
> docker-compose down
> docker-compose up -d
```

## Preview

```
http://localhost:38081
```

## Supplementary Instruction

The way I support just can run in the local, If you want to deploy to the online env. You can follow the steps below:

```javascript
// 1. download the reposity **rap2-dolores**
git clone https://github.com/thx/rap2-dolores.git

// 2. replace endpoint of backend 【src/config/config.prod.js】
module.exports = {
  // your backend endpoint
  serve: 'xxx',
  keys: ['some secret hurr'],
  session: {
    key: 'koa:sess'
  }
}


// 3. bulid
npm run build

// 4. modify docker-compose.yml
// replace image source from docker hub to building locally
services:
  web:
    container_name: rap2-dolores
    restart: always
    # image: rynxiao/rap2:1.0.1
    build: .
    ports:
      - "38081:80"
    command: /bin/sh -c "nginx -g 'daemon off;'"

// 5. up the server
docker-compose up -d
```

More[教你使用docker部署淘宝rap2服务](https://www.cnblogs.com/rynxiao/p/9080179.html)
