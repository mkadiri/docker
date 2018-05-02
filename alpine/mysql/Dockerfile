FROM alpine:3.7

RUN \
	apk add --update \
		mysql \
		mysql-client 		
	
RUN \
	rm -f /var/cache/apk/*
	
	
COPY my.cnf /etc/mysql/my.cnf
		
EXPOSE 3306

COPY startup.sh /startup.sh

CMD ["/startup.sh"]
