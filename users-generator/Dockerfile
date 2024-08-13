FROM python:3.10-slim

WORKDIR /app

RUN pip install pyyaml

COPY ./users-generator.py .

CMD ["python", "users-generator.py"]