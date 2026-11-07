FROM alpine:latest

RUN apk add --no-cache curl bash unzip && \
    curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o xray.zip && \
    unzip xray.zip xray && \
    mv xray /usr/local/bin/ && \
    rm xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 10000

CMD ["xray", "run", "-config", "/etc/xray/config.json"]
