FROM alpine:latest
RUN apk add --no-cache sed
ARG HOST
COPY ./config/prometheus.yaml /etc/prometheus/prometheus_mod.yml
RUN sed -i "s/##TARGET##/$HOST/g" "/etc/prometheus/prometheus_mod.yml"