FROM openjdk:21-jdk-slim

# Install netcat variant that works in slim images
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY target/*.jar app.jar
COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

ENTRYPOINT ["./wait-for-it.sh", "mysql-container", "3306", "--", "java", "-jar", "app.jar"]
