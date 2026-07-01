FROM ubuntu:24.04

LABEL maintainer="hqfang"
LABEL description="AmbiqAI Edge AI Stack - lightweight source image"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

COPY repos.txt /workspace/repos.txt

# Clone all repos (full clone, skip failed ones)
RUN while IFS= read -r line; do \
        line=$(echo "$line" | sed 's/#.*//;s/^[[:space:]]*//;s/[[:space:]]*$//'); \
        [ -z "$line" ] && continue; \
        repo=$(echo "$line" | awk '{print $1}'); \
        branch=$(echo "$line" | awk '{print $2}'); \
        name=$(basename "$repo"); \
        echo "=== Cloning $repo ==="; \
        if [ -n "$branch" ]; then \
            git clone --branch "$branch" "https://github.com/$repo.git" "$name" || echo "WARN: failed to clone $repo"; \
        else \
            git clone "https://github.com/$repo.git" "$name" || echo "WARN: failed to clone $repo"; \
        fi; \
    done < /workspace/repos.txt

CMD ["/bin/bash"]
