FROM ubuntu
RUN apt update && apt install curl -y
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"