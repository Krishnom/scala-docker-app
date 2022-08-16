FROM bde2020/spark-submit:3.3.0-hadoop3.3

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

ENV SPARK_APPLICATION_JAR_LOCATION /app/application.jar
ENV SPARK_APPLICATION_MAIN_CLASS com.mahendran.example.wordcount.WordCount
ENV SPARK_APPLICATION_JAR_NAME spark-poc-1.0-SNAPSHOT
ENV SPARK_MASTER_NAME spark-master
RUN apk add --no-cache openjdk8 maven\
      && mkdir -p /app \
      && mkdir -p /usr/src/app

# Copy the POM-file first, for separate dependency resolving and downloading
COPY pom.xml /usr/src/app
RUN cd /usr/src/app \
      && mvn dependency:resolve
RUN cd /usr/src/app \
      && mvn verify

# Copy the source code and build the application
COPY . /usr/src/app
RUN cd /usr/src/app \
      && mvn package -Dmaven.test.skip=true

RUN cd /usr/src/app && cp target/${SPARK_APPLICATION_JAR_NAME}.jar ${SPARK_APPLICATION_JAR_LOCATION}

CMD ["/bin/bash", "/submit.sh"]
