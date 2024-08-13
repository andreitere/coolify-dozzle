FROM bash:latest

WORKDIR /data

COPY ./users-generator.sh .

RUN chmod +x ./users-generator.sh

CMD ["./data/users-generator.sh"]