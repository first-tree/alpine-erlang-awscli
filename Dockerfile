FROM marksargento/alpine-erlang:21

LABEL maintainer="Mark Sargento <marksargento.00@gmail.com>"
ENV REFRESHED_AT=2019-02-12 \
    AWSCLI_VERSION=${AWSCLI_VERSION:-1.16.102}


RUN apk add --update \
    curl \
    python \
    python-dev \
    py-pip && \
    pip install awscli==$AWSCLI_VERSION --upgrade --user && \
    apk --purge -v del py-pip && \
    rm -rf /var/cache/apk/*

RUN chown -R default:root  ./.local

ENV PATH=$PATH:/opt/app/.local/bin

CMD ["/bin/bash"]
