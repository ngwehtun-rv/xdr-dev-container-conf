FROM node:20-alpine AS build

RUN apk add --no-cache \
    git \
    gcc \
    g++ \
    make \
    curl \
    bash \
    patch \
    musl-dev \
    zlib-dev \
    sqlite-dev \
    bzip2-dev \
    libffi-dev \
    openssl-dev \
    readline-dev

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:$PATH"

RUN curl https://pyenv.run | bash && \
    pyenv install 2.7 && \
    pyenv install 3.11 && \
    pyenv global 3.11 && \
    pyenv rehash

FROM node:20-alpine

RUN apk add --no-cache \
    git \
    curl \
    bash \
    make \
    g++

COPY --from=build /root/.pyenv /root/.pyenv

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:$PATH"

RUN pyenv global 3.11 && \
    npm install -g pnpm esbuild nx

SHELL ["/bin/bash", "-c"]

RUN echo "export PS1='\u@xdr-dev-container:\w\$ '" >> ~/.bashrc

CMD ["/bin/bash"]
