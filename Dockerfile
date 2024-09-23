FROM openjdk:17-jdk-slim AS build

# Set the working directory
WORKDIR .
 
# Copy the JAR file into the container
COPY target/imdb.jar imdb.jar
 
# Use a smaller base image for running the application
FROM openjdk:17-jdk-slim
 
# Set the working directory
WORKDIR .

ADD target/imdb.jar imdb.jar
 
# Copy the JAR file from the build stage
COPY --from=build imdb.jar .

EXPOSE 8080

# Add a health check
HEALTHCHECK --interval=30s --timeout=10s CMD curl -f http://localhost:8080/actuator/health || exit 1

ENTRYPOINT [ "java","-jar","/imdb.jar" ]
