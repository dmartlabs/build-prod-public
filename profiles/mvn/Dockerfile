FROM gcr.io/distroless/java:11

ARG PORTS="8080"
ARG JAVA_ARG_MEM_MIN="-Xms128M"
ARG JAVA_ARG_MEM_MAX="-Xmx256M"
ARG JAVA_ARG_EXTRAS="-Djdk.tls.client.protocols=TLSv1.2"

COPY ./target/*.jar /app/app.jar
WORKDIR /app

EXPOSE $PORTS
ENV _JAVA_OPTIONS "$JAVA_ARG_MEM_MIN $JAVA_ARG_MEM_MAX $JAVA_ARG_EXTRAS"

CMD ["app.jar"]
