FROM python:3.8

COPY . /app
WORKDIR /app
RUN apt update && apt install -yqq g++ gcc libc6-dev make pkg-config libffi-dev python3-dev git
RUN pip3 install pipenv
RUN pipenv install --system --deploy --ignore-pipfile
RUN pip3 install -r requirements.txt
RUN chmod +x /app/src/init.py
ENTRYPOINT /app/run_linux.sh


