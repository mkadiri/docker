FROM alpine:3.7

RUN \
	apk add --no-cache mongodb && \
	rm /usr/bin/mongoperf

VOLUME /data/db
EXPOSE 27017 28017

COPY start.sh /root
ENTRYPOINT [ "/root/start.sh" ]
CMD [ "mongod" ]