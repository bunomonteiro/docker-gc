FROM alpine:3.16
ENV CRON_EXPRESSION="*	*	*	*	*"
WORKDIR /home
COPY . .
RUN apk upgrade --available && \
    apk add --update --no-cache tini docker openrc busybox-initscripts && \
    mkdir -p /run/openrc && \
    touch /run/openrc/softlevel
ENTRYPOINT ["/home/entrypoint.sh"]

# Running as ad-doc
#
# Example 1: prune every minute
# docker run -d -v /var/run/docker.sock:/var/run/docker.sock bunomonteiro/docker-gc
#
# Example 2: prune at 00:00 everyday
# docker run -d -v /var/run/docker.sock:/var/run/docker.sock -e CRON_EXPRESSION="0 0 * * *" bunomonteiro/docker-gc