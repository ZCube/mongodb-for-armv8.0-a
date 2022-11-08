ARG VERSION=6.0.2
FROM mongo:${VERSION}

RUN apt-get update && apt-get install -y \
    curl \
 && rm -rf /var/lib/apt/lists/*

ARG VERSION=6.0.2
RUN case "$(dpkg --print-architecture)" in \
		arm64) \
            cd /tmp && \
            curl -LO https://media.githubusercontent.com/media/ZCube/mongodb-for-armv8.0-a/main/binary/mongo-v${VERSION}.tar.gz && \
            tar zxvf mongo-v${VERSION}.tar.gz && \
            mv -f ./bin/mongos /usr/bin/mongos && \
            mv -f ./bin/mongod /usr/bin/mongos && \
            rm -rf /tmp/* ;; \
	esac;
