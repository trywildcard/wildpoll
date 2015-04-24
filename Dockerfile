FROM trenpixster/elixir:1.0.4

ADD . /opt/wildpoll
WORKDIR /opt/wildpoll

RUN mix do deps.get, deps.compile, compile
PORT 4000
CMD mix phoenix.server
