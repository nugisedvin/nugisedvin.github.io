FROM archlinux/base

RUN pacman -Syu --noconfirm fish git ruby

RUN pacman -Sy --noconfirm base-devel
RUN gem install bundler jekyll

ENV PATH $PATH:/root/.gem/ruby/2.6.0/bin
ADD . /src

WORKDIR /src
RUN bundler install

EXPOSE 4000:4000
CMD bundler exec jekyll serve --host 0.0.0.0 --verbose

#sudo docker build -t nugisedvin .
#sudo docker run -it -p 4000:4000 nugisedvin:latest