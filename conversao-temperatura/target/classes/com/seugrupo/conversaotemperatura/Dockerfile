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
