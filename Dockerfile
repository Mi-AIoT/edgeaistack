FROM ubuntu:24.04

LABEL maintainer="hqfang"
LABEL description="AmbiqAI Edge AI Stack - lightweight source image"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    curl \
    wget \
    unzip \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Copy pre-cloned repos and downloaded packages from CI build context
COPY src/ /workspace/
COPY aitg-packages/ /workspace/aitg-packages/

CMD ["/bin/bash"]
