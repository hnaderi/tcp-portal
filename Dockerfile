FROM scratch
LABEL maintainer="mail@hnaderi.dev"
COPY ./tcp-portal /
ENTRYPOINT ["/tcp-portal"]
