FROM alpine:3.7

ENV GLASSFISH_PKG=glassfish-5.0.zip \
    GLASSFISH_URL=https://download.oracle.com/glassfish/5.0/release/glassfish-5.0.zip \
    GLASSFISH_HOME=/glassfish5 \
    MD5=c87ad9b589db15973f5c80773171b5b4 \
    PATH=$PATH:/glassfish5/bin \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN \
    apk --update add \ 
        openjdk8-jre \
        curl \
        unzip
        
RUN \
    curl -O $GLASSFISH_URL && \
    echo "$MD5 *$GLASSFISH_PKG" | md5sum -c - && \
    unzip -o $GLASSFISH_PKG && \
    rm -f $GLASSFISH_PKG
    
RUN \    
    apk del \
        unzip \
        curl   
        
EXPOSE 8080 4848

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]