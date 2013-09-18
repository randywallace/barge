FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN apt-get update && apt-get -y upgrade && apt-get -y install curl git-core
RUN curl -L https://get.rvm.io | bash -s stable --ruby

RUN bash -lc 'rvm install 2.0.0'
RUN bash -lc 'rvm --default 2.0.0'
RUN /usr/local/rvm/bin/rvm cleanup all

EXPOSE 3000:3000

CMD [ "/bin/bash", "-l" ]

# Now for a dev environment, i do from the root of this repo 
#
# docker build -t barge .
#
# docker run -i -t -v /home/<user>/git/barge:/barge barge
#
# And then from inside the container...
#
# gem install bundler && bundle install && rails s
#
