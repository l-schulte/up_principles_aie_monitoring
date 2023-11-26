FROM alpine:latest
RUN apk add --no-cache sed
ARG HOST
ARG YAMLURL
RUN wget -O /prometheus.yml $YAMLURL
RUN sed -i "s/##TARGET##/$HOST/g" /prometheus.yml