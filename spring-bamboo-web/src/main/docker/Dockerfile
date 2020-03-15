FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD  spring-bamboo-web-1.0.0.jar app.jar
ENTRYPOINT ["java","-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8091","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
# 告诉Docker服务端暴露的端口，在容器启动时需要通过 -p 做端口映射
EXPOSE 9966
EXPOSE 8091
#设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
