FROM alpine:3.7

ENV GLASSFISH_PACKAGE=glassfish-5.0.zip \
    GLASSFISH_PACKAGE_MD5=c87ad9b589db15973f5c80773171b5b4 \
    GLASSFISH_URL=https://download.oracle.com/glassfish/5.0/release/glassfish-5.0.zip \
    GLASSFISH_HOME=/glassfish5 \
    PATH=$PATH:/glassfish5/bin \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

# Install required packages
# Intsall glassfish-5
# Uninstall uneeded packages
RUN \
		apk --update add \ 
			openjdk8-jre \
			curl \
			unzip && \
    \
		curl -O $GLASSFISH_URL && \
		echo "$GLASSFISH_PACKAGE_MD5 *$GLASSFISH_PACKAGE" | md5sum -c - && \
		unzip -o $GLASSFISH_PACKAGE && \
		rm -f $GLASSFISH_PACKAGE && \
    \    
		rm -rf \
			/tmp/* \
			/var/cache/apk/* && \
		apk del \
			curl \
			unzip
			
EXPOSE 8080 4848

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]