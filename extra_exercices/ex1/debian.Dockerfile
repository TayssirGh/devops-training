FROM ubuntu

ADD ./runner.sh /usr/src/runner.sh

RUN chmod +x /usr/src/runner.sh

CMD ["/usr/src/runner.sh"]