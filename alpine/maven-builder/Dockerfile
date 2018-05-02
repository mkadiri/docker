FROM alpine:3.7

ENV \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
	MAVEN_URL=http://apache.osuosl.org/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz \
	MAVEN_HOME=/usr/share/maven \
	MAVEN_CONFIG="/root/.m2" \
	MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1" 
  
RUN \
	apk --update add \
		openjdk8-jre \
		curl \
		tar \
		bash
	
RUN \
	mkdir -p /usr/share/maven && \
	curl -fsSL $MAVEN_URL | tar -xzC /usr/share/maven --strip-components=1 && \
	ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENTRYPOINT ["/usr/bin/mvn"]

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY sample-pom.xml /usr/src/app/pom.xml

RUN \
	mvn -T 1C install && \
	rm -rf target

# COPY src /usr/src/app/src