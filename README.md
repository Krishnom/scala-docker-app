## How to run the example on docker
Edit /etc/hosts file and add below entry
<you machine ip>  spark-master

1. Create docker image. 
```bash 
 
docker build --rm=true -t bde/spark-app .

```

2. Start 1 master and 1 worker node
```bash 
docker rm -f spark-master spark-worker-1
docker run --name spark-master --network host -d bde2020/spark-master:3.3.0-hadoop3.3
docker run --name spark-worker-1  --network host -d  bde2020/spark-worker:3.3.0-hadoop3.3
```
3. Start docker container to submit our app to spark
```bash 
docker run --name my-spark-app  --network host bde/spark-app
```