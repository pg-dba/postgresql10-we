FROM postgres:10

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install lsb-release gnupg2 wget iputils-ping
RUN apt-get -y install perl postgresql-plperl-10
RUN wget https://github.com/zubkov-andrei/pg_profile/releases/download/0.3.4/pg_profile--0.3.4.tar.gz
RUN tar xzf pg_profile--0.3.4.tar.gz --directory $(pg_config --sharedir)/extension

RUN apt-get clean all

WORKDIR /var/lib/postgresql
