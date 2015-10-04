FROM busybox

ADD docker.sh /
RUN /docker.sh
