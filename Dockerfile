FROM alpine:latest
MAINTAINER Ricardo Bernardeli <ricardo@netengine.com.au>

RUN apk --update add bash python py-pip

RUN pip install awscli

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh", "backup"]
