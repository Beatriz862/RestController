# Use a imagem base do Maven para compilar o projeto
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY conversao-temperatura/pom.xml .
COPY conversao-temperatura/src ./src
RUN mvn clean package -DskipTests

# Use a imagem base do OpenJDK para rodar a aplicação
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080