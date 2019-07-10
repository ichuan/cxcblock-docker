FROM debian:9.9

WORKDIR /opt
VOLUME /opt/coin

EXPOSE 7318

RUN apt-get update && apt-get install -y wget
RUN wget -O  - https://github.com/cxcblock/cxcs/archive/master.tar.gz | tar -C /opt/ -xzf -
RUN cd cxcs-master && cp -rf Linux/lib/* /usr/lib/ && cp Linux/cxcs* /usr/bin/ && chmod +x /usr/bin/cxcs*

# cleanup
RUN rm -rf /var/lib/apt/lists/* && rm -rf /opt/cxcs-master

ENTRYPOINT ["cxcsz", "CXCChain", "-daemon=0", "-datadir=/opt/coin", "-txindex", "-server", "-rest", "-rpcbind=0.0.0.0", "-rpcport=7318", "-rpcallowip=0.0.0.0/0", "-rpcuser=user", "-rpcpassword=password"]
