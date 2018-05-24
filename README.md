# rap2-docker
docker部署淘宝rap2服务

## 后端部署

```cmd
> cd rap2-delos
> docker-compose up -d
> docker exec -it rap2-delos sh
> node scripts/init
> exit
> docker-compose down
> docker-compose up -d
```

## 前端部署

修改`src/config/config.prod.js`中的后端服务器地址

```javascript
// http://xxx.xxx.xxx.xx:38080替换成自己服务器地址，或者域名
module.exports = {
  serve: 'http://xxx.xxx.xxx.xx:38080',
  keys: ['some secret hurr'],
  session: {
    key: 'koa:sess'
  }
}
```

启动服务

```cmd
> cd rap2-dolores
> docker-compose up -d
```

更多请看文章[教你使用docker部署淘宝rap2服务](https://www.cnblogs.com/rynxiao/p/9080179.html)
