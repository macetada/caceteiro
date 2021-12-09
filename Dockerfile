FROM debian:10.11 AS builder

ENV DEBCONF_NOWARNINGS="yes"
RUN apt-get update && apt-get install unzip make gcc git wget -y

WORKDIR /src
RUN git clone https://github.com/wg/wrk.git
RUN make -C wrk/

FROM python:3.10.1-bullseye

ENV DEBCONF_NOWARNINGS="yes"
RUN apt-get update && apt-get install apache2-utils -y

WORKDIR /app
COPY --from=builder /src/wrk/wrk /usr/bin/wrk
COPY entrypoint.py .

ENTRYPOINT [ "sh", "-c", "./entrypoint.py $@" ]
