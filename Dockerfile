# From: https://medium.com/@qhwa_85848/build-docker-images-from-an-elixir-project-why-and-how-78e19468210
FROM qhwa/elixir-builder:latest AS builder

ARG mix_env=prod
ENV MIX_ENV=${mix_env}

WORKDIR /src

COPY mix.exs mix.lock /src/
RUN mix deps.get --only $MIX_ENV

ADD . .
RUN mix release --path /app --quiet

# Multi-stage
FROM qhwa/elixir-runner:latest

ARG mix_env=prod
ENV MIX_ENV=${mix_env}

COPY --from=builder /app /app
WORKDIR /app

ENTRYPOINT ["/app/bin/whos_the_man"]
CMD ["start"]
