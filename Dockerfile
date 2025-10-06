FROM debian:stable-slim
COPY docker_testing /bin/docker_testing
ENV PORT=8991

CMD ["/bin/docker_testing"]
