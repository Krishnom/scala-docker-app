## How to run the example on docker

1. Create docker image. 
```bash 
 
docker build --rm=true -t bde/spark-app .

```

2. Start 1 master and 1 worker node
```bash 
docker run --name spark-master -h spark-master:7077 -d bde2020/spark-master:3.3.0-hadoop3.3
docker run --name spark-worker-1 --link spark-master:spark-master -d bde2020/spark-worker:3.3.0-hadoop3.3
```
3. Start docker container to submit our app to spark
```bash 
docker run --name my-spark-app --link spark-master:spark-master -d bde/spark-app
```