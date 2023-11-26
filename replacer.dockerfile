FROM alpine:latest
RUN apk add --no-cache sed
ARG HOST
ARG YAMLURL
RUN mkdir /dockertmp
RUN wget -O /dockertmp/prometheus.yml $YAMLURL
RUN touch test.txt
RUN sed -i "s/##TARGET##/$HOST/g" /dockertmp/prometheus.yml