FROM alpine:latest
RUN apk add --no-cache sed
ARG HOST
RUN sed -i "s/##TARGET##/$HOST/g" "/etc/prometheus/prometheus.yml"