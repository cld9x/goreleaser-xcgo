FROM dockercore/golang-cross

ENV GORELEASER_VERSION=0.114.0
ENV GORELEASER_SHA=cbe4dfcbebc7bb191b279aa48a765d2a098f3295a4b5d7b31c99bb6b1acff973

ENV GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

RUN  wget ${GORELEASER_DOWNLOAD_URL}; \
			echo "$GORELEASER_SHA $GORELEASER_DOWNLOAD_FILE" | sha256sum -c - || exit 1; \
			tar -xzf $GORELEASER_DOWNLOAD_FILE -C /usr/bin/ goreleaser; \
			rm $GORELEASER_DOWNLOAD_FILE;

RUN apt-get update && apt-get install -y gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

CMD ["goreleaser", "-v"]
