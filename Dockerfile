FROM python:3.10-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app
RUN mkdir $WORKDIR/static

RUN apk add --no-cache --virtual build-base gcc postgresql-dev linux-headers musl-dev libffi-dev jpeg-dev zlib-dev
RUN pip install --upgrade pip
RUN pip install pipenv
COPY ./Pipfile .
RUN pipenv install --skip-lock

COPY . .
ENTRYPOINT ["sh", "./entrypoint.sh"]
