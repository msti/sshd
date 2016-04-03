FROM alpine:3.3

RUN apk add --update openssh

RUN rm -rf /var/cache/apk/*

RUN mkdir /var/run/sshd && mkdir /root/.ssh

COPY authorized_keys /root/.ssh

# generate host ssh keys
RUN /usr/bin/ssh-keygen -A

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
