# Source https://github.com/tdlib/telegram-bot-api
FROM alpine:3.19 as build

# Commands generated for alpine linux by https://tdlib.github.io/telegram-bot-api/build.html?os=Linux
RUN apk add --no-cache --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake &&\
    git clone --recursive https://github.com/tdlib/telegram-bot-api.git                       &&\
    cd telegram-bot-api                                                                       &&\
    rm -rf build                                                                              &&\
    mkdir build                                                                               &&\
    cd build                                                                                  &&\
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..                &&\
    cmake --build . --target install                                                          &&\
    cd ../..                                                                                  &&\
    ls -l /usr/local/bin/telegram-bot-api*


FROM alpine:3.19 as env

RUN apk add --no-cache --update zlib-dev openssl-dev gperf

COPY --from=build /usr/local/bin/telegram-bot-api /usr/local/bin/telegram-bot-api

ENTRYPOINT ["telegram-bot-api", "-p", "8081"]