FROM maccam912/nodejs
MAINTAINER Matt Koski <maccam912@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git python build-essential wget screen tmux curl unzip vim -y

RUN mkdir /Development
RUN cd /Development && git clone git://github.com/joyent/node

RUN cd /Development/node && ./configure && make && make install
RUN rm -rf /Development/node
RUN chmod 777 -R /Development

RUN npm install -g bower grunt-cli yo generator-meanjs express

RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

RUN wget http://downloads.activestate.com/stackato/client/v3.1.1/stackato-3.1.1-linux-glibc2.3-x86_64.zip && ls && unzip stackato*

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000



RUN echo "\n##############################\nStackato installed\n##############################\n"

