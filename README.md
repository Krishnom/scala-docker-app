## How to run the example on docker
Edit /etc/hosts file and add below entry
<you machine ip>  spark-master

1. Create docker image. 
```bash 
 
docker build --rm=true -t bde/spark-app .

```

2. Start 1 master and 1 worker node
```bash 
docker run --name my-spark-app  --network host -d bde/spark-app
docker rm -f my-spark-app

```
3. Start docker container to submit our app to spark
```bash 
docker run --name my-spark-app  --network host bde/spark-app
```