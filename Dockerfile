FROM ubuntu

ENV RANCHER_CLI_VERSION=v2.6.4-rc2

RUN apt update && apt install -y curl dos2unix git

# Install kubctl CLI tool
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install helm CLI tool
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install rancher CLI
RUN curl -L "https://github.com/rancher/cli/releases/download/${RANCHER_CLI_VERSION}/rancher-linux-amd64-${RANCHER_CLI_VERSION}.tar.gz" | tar -xvzf - \
    && mv "rancher-${RANCHER_CLI_VERSION}/rancher" /usr/local/bin/rancher \
    && chmod +x /usr/local/bin/rancher
	
ADD entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh && chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD exec 