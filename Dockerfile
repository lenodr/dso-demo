FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY .  .
RUN mvn package -DskipTests

FROM openjdk:19-jdk-alpine as RUN
WORKDIR /run
COPY --from=BUILD /app/target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
CMD java  -jar /run/demo.jar
