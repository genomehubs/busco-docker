## BUSCO docker container

BUSCO docker container built from [hub.docker.com/r/vera/busco](https://hub.docker.com/r/vera/busco/)
with modifications to make it easier to use as a GenomeHubs container by running as UID 1000, separating input and output 
directories and renaming output files.

Clone this repository

```
git clone https://github.com/genomehubs/busco-docker.git
cd busco-docker
```

Fetch BUSCO lineages

```
wget http://busco.ezlab.org/v2/datasets/insecta_odb9.tar.gz
...
```

Build the docker image

```
docker build -t busco .
```

Run BUSCO

```
mkdir busco
docker run -d \
           --name busco-test \
           -v `pwd`/sequence:/in \
           -v `pwd`/busco:/out \
           -e INFILE=Test.fa.gz \
           busco -l insecta_odb9 -m genome -c 8 -sp fly
```
