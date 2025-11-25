FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install OS dependencies needed for pyttsx3
RUN apt-get update && apt-get install -y \
    espeak \
    libespeak-ng1 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install flask

COPY . .

EXPOSE 8080

CMD ["python", "Jarvis/web_server.py"]

