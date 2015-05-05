FROM trenpixster/elixir:1.0.4

ENV DEBIAN_FRONTEND noninteractive
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_0.10 trusty main' > /etc/apt/sources.list.d/nodesource.list && \
    echo 'deb-src https://deb.nodesource.com/node_0.10 trusty main' >> /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y nodejs

RUN mkdir /opt/wildpoll
WORKDIR /opt/wildpoll
ADD package.json /opt/wildpoll/package.json
RUN npm install
RUN mix local.hex --force

ADD . /opt/wildpoll
ENV MIX_ENV prod
RUN mix do deps.get, deps.compile, compile

EXPOSE 4000
CMD mix phoenix.server
