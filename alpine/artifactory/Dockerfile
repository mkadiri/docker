FROM alpine:3.7

ENV \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
	ARTIFACTORY_PACKAGE=artifactory-oss-5.11.0.zip \
    ARTIFACTORY_PACKAGE_MD5=5e00a63494a2c308ce8514575d895062 \
	ARTIFACTORY_URL=https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-5.11.0.zip \
    CATALINA_HOME=/artifactory-oss-5.11.0/tomcat \
    CATALINA_OUT=/dev/null
    
RUN \
		apk --update add \ 
			openjdk8-jre \
			curl \
			unzip && \
	\
		curl -L -o $ARTIFACTORY_PACKAGE $ARTIFACTORY_URL && \
		echo "$ARTIFACTORY_PACKAGE_MD5 *$ARTIFACTORY_PACKAGE" | md5sum -c - && \
		unzip -o $ARTIFACTORY_PACKAGE && \
		rm -f $ARTIFACTORY_PACKAGE && \
	\
		rm -rf \
			/tmp/* \
			/var/cache/apk/* && \
		apk del \
			unzip \
			curl 
			
EXPOSE 8081

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]