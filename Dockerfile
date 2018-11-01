FROM elixir:1.6.6-alpine
MAINTAINER Fiqus

RUN apk update && apk add erlang-dev \
 && apk add --virtual build-dependencies build-base automake gcc git curl bash \
 && apk add erlang-parsetools

# Install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

# Install node
RUN apk add nodejs

# Create app folder
RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix deps.get && mix compile

CMD ["tail", "-f", "/dev/null"]
# Run phonenix
#CMD ["mix", "phx.server"]
