FROM alpine:latest
RUN apk add --no-cache sed
ARG HOST
RUN wget -O /prometheus.yml https://share.cubenote.de/downloadFile?id=Rd7y99GlLLfyWDw
RUN sed -i "s/##TARGET##/$HOST/g" /prometheus.yml