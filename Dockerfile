FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y ffmpeg git libglib2.0-0 libsm6 libxext6 libxrender-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 3000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "3000"]
