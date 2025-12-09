FROM python:3.11-slim
LABEL maintainer="Guyomardkylian@gmail.com"
LABEL description="Application de vote"
RUN useradd -m -u 1000 voteuser
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN chown -R voteuser:voteuser /app
USER voteuser
EXPOSE 8080
ENV FLASK_APP=app.py
ENV REDIS_HOST=redis
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080').read()" || exit 1
CMD ["python", "app.py"]