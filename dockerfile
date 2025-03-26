# Use official OpenJDK base image
FROM openjdk:latest

# Set working directory
WORKDIR /app

# Copy Java program to the container
COPY HelloWorld.java .

# Compile Java program
RUN javac HelloWorld.java

# Command to run Java program
CMD ["java", "HelloWorld"]