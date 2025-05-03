FROM python:3.9-slim

# Instala dependências do sistema
RUN apt-get update && apt-get install -y ffmpeg git && apt-get clean

# Diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Exponha a porta que será usada (igual à do Coolify)
EXPOSE 3000

# Inicia o servidor FastAPI
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "3000"]
