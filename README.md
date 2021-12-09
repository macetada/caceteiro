# `macetada/caceteiro`

Repositório temporário para macetar requests contra o Nginx, FastAPI, Gin, Actix
e NodeJS.

## Subindo os servers

```bash
git clone https://github.com/macetada/comboio.git
cd comboio/
docker-compose up -d
```

> Este procedimento deve ser feito numa máquina servidora ou num cluster.

## Macetando os servers

```bash
export HOST="172.17.0.1" # ou HOST=seu-dominio.com
export SERVERS="8080;8081;8082;8083;8084;8085"
export CLIENTS=100
export REQUESTS=10000
export SLEEP=5
```

```bash
docker pull ghcr.io/macetada/caceteiro:main
docker run --rm -t \
  -e HOST=${HOST} \
  -e SERVERS=${SERVERS} \
  -e CLIENTS=${CLIENTS} \
  -e REQUESTS=${REQUESTS} \
  -e SLEEP=${SLEEP} \
  ghcr.io/macetada/caceteiro:main
```

ou:

```bash
git clone https://github.com/macetada/caceteiro.git
cd caceteiro/
docker build -t ab-wrk .
docker run --rm -t \
  -e HOST=${HOST} \
  -e SERVERS=${SERVERS} \
  -e CLIENTS=${CLIENTS} \
  -e REQUESTS=${REQUESTS} \
  -e SLEEP=${SLEEP} \
  ab-wrk
```

> Este procedimento deve ser feito numa máquina client com razoável poder de processamento.
