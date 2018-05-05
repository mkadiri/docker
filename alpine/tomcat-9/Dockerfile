FROM alpine:3.7

ENV \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    MD5=2347696731b17d6320d77aa6e24435f6 \
    TOMCAT_PKG=apache-tomcat-9.0.7.zip \
    TOMCAT_HOME=/apache-tomcat-9.0.7 \
    TOMCAT_URL=http://mirror.vorboss.net/apache/tomcat/tomcat-9/v9.0.7/bin/apache-tomcat-9.0.7.zip \
    CATALINA_HOME=/apache-tomcat-9.0.7 \
    CATALINA_OUT=/dev/null \
    PATH=/apache-tomcat-9.0.7/bin:$PATH    
    
RUN \
    apk --update add \ 
        openjdk8-jre \
        curl \
        unzip 
        
RUN \
    curl -O $TOMCAT_URL && \
    echo "$MD5 *$TOMCAT_PKG" | md5sum -c - && \    
    unzip -o $TOMCAT_PKG && \
    rm -f $TOMCAT_PKG && \
    chmod +x /apache-tomcat-9.0.7/bin/catalina.sh && \
    chmod +x /apache-tomcat-9.0.7/bin/startup.sh

RUN \    
    rm -rf \
        /tmp/* \
        /var/cache/apk/* && \
    apk del \
        unzip \
        curl  

EXPOSE 8080

CMD ["catalina.sh", "run"]