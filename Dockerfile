
# Example of custom Java runtime using jlink in a multi-stage container build
FROM eclipse-temurin:11 as jre-build

# Create a custom Java runtime
RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base,java.instrument,java.security.jgss,java.desktop,java.management.rmi,java.sql \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /javaruntime

# Define your base image
FROM debian:buster-slim
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime $JAVA_HOME

# Continue with your application deployment

RUN mkdir /opt/app
COPY target/demo.jlink-0.0.1-SNAPSHOT-exec.jar /opt/app
CMD ["java", "-jar", "/opt/app/demo.jlink-0.0.1-SNAPSHOT-exec.jar"]
