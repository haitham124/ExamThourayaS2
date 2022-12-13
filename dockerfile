FROM openjdk:8-jre-alpine
ADD target/ratrapage-1.0.jar ratrapage-1.0.jar
EXPOSE 8089
CMD ["java", "-jar", "/ratrapage-1.0.jar"]
