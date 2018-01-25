FROM openjdk:8

# USER app
ENV JAVASPRINGBOOT 1

# Install maven
RUN apt-get update
RUN apt-get install -y maven

RUN mkdir /publisher
WORKDIR /publisher

ADD . /publisher

RUN mvn install
CMD ["start_server.sh"]



# Prepare by downloading dependencies

# RUN ["mvn", "dependency:resolve"]
# RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
# ADD src /code/src
# RUN ["mvn", "package"]

# EXPOSE 4567
# CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/sparkexample-jar-with-dependencies.jar"]