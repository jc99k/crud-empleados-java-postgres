# Stage 1: Build the application
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Stage 2: Create the final image
FROM tomcat:9.0-jdk11-corretto
COPY --from=build /app/target/crud-empleados-java-postgres.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
