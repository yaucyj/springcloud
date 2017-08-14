FROM anapsix/alpine-java
MAINTAINER cyj
ADD goplus-serviceregistry-0.0.1-SNAPSHOT.jar /app.jar

ENV EUREKA_SERVER_LIST=http://localhost:8761/eureka/


ENV TIME_ZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

EXPOSE 8761

RUN bash -c 'touch /app.jar'

#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--spring.profiles.active=default"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]