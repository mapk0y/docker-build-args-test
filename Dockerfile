FROM debian
ARG user="nginx"
RUN groupadd ${user} \
 && useradd -g ${user} ${user}
USER ${user}
