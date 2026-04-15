FROM maven:3.9.11-eclipse-temurin-8 AS builder

WORKDIR /app

COPY pom.xml .
COPY src ./src
COPY WebContent ./WebContent

RUN mvn clean package -DskipTests

FROM tomcat:9.0

COPY --from=builder /app/target/shopping-cart.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
