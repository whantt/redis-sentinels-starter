# redis-sentinels-starter
Redis哨兵集群快速启动。

```
sh redis-sentinels-starter.sh
```

启动 
- 1个`master`节点，监听`6379`端口
- 2个`slave`节点，监听`6380`,`6381`端口
- 3个`sentinel`节点，监听`10859`,`10861`,`10862`端口
- requirepass `123456`