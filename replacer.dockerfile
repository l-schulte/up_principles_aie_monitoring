FROM alpine:latest
RUN apk add --no-cache sed
ARG HOST
ARG YAMLURL
RUN mkdir /dockertmp
RUN touch /dockertmp/test.txt
RUN wget -O /dockertmp/prometheus.yml $YAMLURL
RUN sed -i "s/##TARGET##/$HOST/g" /dockertmp/prometheus.yml