FROM mcr.microsoft.com/azure-cli:2.50.0
# 2.50.0
    MAINTAINER Øystein Strœte <github@qbits.no>

# Install bicep, kubectl, fluxcd, and Helm
RUN az bicep install && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    echo 'source <(kubectl completion bash)' >> /root/.bashrc && \
    echo "alias k='kubectl'" >> /root/.bashrc && \
    curl -s https://fluxcd.io/install.sh | bash && \
    echo "command -v flux >/dev/null && . <(flux completion bash)" >> /root/.bashrc && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

COPY src/ /src/

WORKDIR /src/deploy

ENTRYPOINT ["make"]
