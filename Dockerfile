FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir requests

WORKDIR /app

COPY main.py config.json ./

RUN mkdir -p /app/output

VOLUME ["/app/output"]

CMD ["python", "main.py"]
