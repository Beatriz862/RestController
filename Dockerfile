
# Use a imagem base do OpenJDK
FROM openjdk:17-jdk-slim

# Define o diretório de trabalho
WORKDIR /app

# Copie o JAR da aplicação para o contêiner
COPY target/conversao-temperatura-1.0-SNAPSHOT.jar app.jar

# Exponha a porta em que a aplicação será executada
EXPOSE 8080

# Defina o comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "/app.jar"]
# Use a imagem base do OpenJDK
FROM openjdk:17-jdk-slim

# Define o diretório de trabalho
WORKDIR /app

# Copie o JAR da aplicação para o contêiner
COPY target/conversao-temperatura-1.0-SNAPSHOT.jar app.jar

# Exponha a porta em que a aplicação será executada
EXPOSE 8080

# Defina o comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Usando a imagem base do Maven para compilar o projeto
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY conversao-temperatura/src ./src
RUN mvn clean package -DskipTests

# Usando a imagem base do OpenJDK para rodar a aplicação
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

