FROM openjdk:11
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN ./gradlew bootJar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "build/libs/starling-roundup.jar"]
