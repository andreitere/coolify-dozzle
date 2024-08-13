FROM python:3.10-slim

WORKDIR /data

RUN pip install pyyaml

COPY ./users-generator.py .

CMD ["python", "/users-generator.py"]