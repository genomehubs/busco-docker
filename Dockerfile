FROM vera/busco
MAINTAINER Richard Challis/LepBase contact@lepbase.org

RUN apt-get update && apt-get install -y \
    gzip

RUN mkdir /out

RUN adduser --disabled-password --gecos '' dockeruser

RUN chown -R dockeruser /data

RUN chown -R dockeruser /opt/augustus-3.2.2/config/

WORKDIR /data

COPY startup.sh /

USER dockeruser

COPY *.tar.gz /data

RUN tar xf *.tar.gz && rm *.tar.gz

ENTRYPOINT ["/startup.sh"]

#CMD /startup.sh
