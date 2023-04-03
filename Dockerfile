FROM maven As build
WORKDIR /app
COPY . /app
RUN mvn clean package
# CMD ["java", "-jar", "target/ABCtechnologies-1.0.war"]

FROM tomcat:latest
COPY --from=build /app/target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080