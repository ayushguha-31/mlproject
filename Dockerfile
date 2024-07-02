FROM python:3.7-slim-buster
WORKDIR /app
COPY . /app

RUN apt update -y
# Make port 80 available to the world outside this container
EXPOSE 80

RUN apt-get update && pip install -r requirements.txt
CMD ["python3", "app.py"]