FROM gcr.io/distroless/java:11

ARG PORTS 8080
ARG JAVA_ARG_MEM_MIN="-Xms256M"
ARG JAVA_ARG_MEM_MAX="-Xmx1024M"
ARG JAVA_ARG_EXTRAS="-Djdk.tls.client.protocols=TLSv1,TLSv1.1,TLSv1.2 -javaagent:/opt/dmart/workdir/glowroot/glowroot.jar \
-Dglowroot.collector.address=glowroot.glowroot.svc.cluster.local:8181 \
-Dglowroot.agent.id='$SHORT_REPO_NAME'::'"

COPY ./glowroot /app/
COPY ./base-*.jar /app/base.jar
WORKDIR /app
EXPOSE ${PORTS} 

# Setup glowroot
RUN chown noroot:noroot /opt/dmart/workdir/glowroot
RUN chmod ug+w /opt/dmart/workdir/glowroot
COPY ./glowroot /opt/dmart/workdir/glowroot/
ENV JAVA_ARG_EXTRAS=$JAVA_ARG_EXTRAS' -javaagent:/app/glowroot/glowroot.jar \
-Dglowroot.collector.address=glowroot.glowroot.svc.cluster.local:8181 \
-Dglowroot.agent.id='$SHORT_REPO_NAME'::'

USER noroot
CMD ["sh", "-c" ,"java -jar \
                    ${JAVA_ARG_MEM_MIN} \
                    ${JAVA_ARG_MEM_MAX} \
                    ${JAVA_ARG_EXTRAS} \
                    app.jar"]

