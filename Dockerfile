# Build stage for React
FROM node:18 AS frontend-build
WORKDIR /app/frontend
COPY front-end/package*.json ./
RUN npm install
COPY front-end/ ./
RUN npm run build

# Build stage for Spring Boot
FROM maven:3.9.9-eclipse-temurin-17 AS backend-build
WORKDIR /app
COPY back-end/ ./
COPY --from=frontend-build /app/frontend/build/ ./src/main/resources/static/
RUN mvn clean package -DskipTests

# Final stage
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=backend-build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"] 