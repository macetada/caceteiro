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
docker pull ghcr.io/macetada/caceteiro:main
docker run --rm -t ghcr.io/macetada/caceteiro:main -- \
  http://172.17.0.1:8080 -c 100 -r 10000 -p wrk
```

ou:

```bash
git clone https://github.com/macetada/caceteiro.git
cd caceteiro/
docker build -t ab-wrk .
docker run --rm -t ab-wrk -- http://172.17.0.1:8080 -c 100 -r 10000 -p wrk
```

> Este procedimento deve ser feito numa máquina client com razoável poder de processamento.
