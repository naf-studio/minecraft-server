FROM eclipse-temurin:21-jre-jammy

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        python3 \
        tzdata && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 minecraft && \
    useradd -u 1000 -g minecraft -m -s /bin/bash minecraft

WORKDIR /server

ENV MEMORY="8G" \
    TZ="Asia/Ho_Chi_Minh" \
    AUTO_SETUP="true"

COPY --chown=minecraft:minecraft . /server/

RUN chmod +x /server/setup.sh /server/run.sh

USER minecraft

EXPOSE 25565/tcp 19132/udp 24454/udp

ENTRYPOINT ["/bin/bash", "-c", "if [ \"$AUTO_SETUP\" = \"true\" ] && [ ! -f server.jar ]; then ./setup.sh; fi; exec ./run.sh"]
