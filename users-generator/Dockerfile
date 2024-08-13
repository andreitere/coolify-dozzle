FROM bash:latest

WORKDIR /data

COPY ./users-generator.sh .

RUN chmod +x ./users-generator.sh

CMD ["bash", "./users-generator.sh"]