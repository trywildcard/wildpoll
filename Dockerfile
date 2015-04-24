FROM trenpixster/elixir:1.0.4

ADD . /opt/wildpoll
WORKDIR /opt/wildpoll
RUN mix local.hex --force
RUN mix do deps.get, deps.compile, compile
EXPOSE 4000
CMD mix phoenix.server
