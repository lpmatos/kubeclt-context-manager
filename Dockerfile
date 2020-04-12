ARG ALPINE_VERSION=3.11

FROM alpine:${ALPINE_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com" \
        org.label-schema.version="1.0.0" \
        org.label-schema.release-data="12-04-2020" \
        org.label-schema.url="https://github.com/lpmatos" \
        org.label-schema.alpine="https://alpinelinux.org/" \
        org.label-schema.bash="https://www.gnu.org/software/bash/" \
        org.label-schema.kubectl="https://kubernetes.io/docs/tasks/tools/install-kubectl/" \
        org.label-schema.name="Kubectl Context Manager"

ENV KUBECONFIG=/root/.kube/config \
    KUBECONFIG_CLUSTER=YXBpVmVyc2lvbjogdjEKa2luZDogQ29uZmlnCmNsdXN0ZXJzOgotIG5hbWU6ICJla3MtZGV2b3BzLWRldmVsb3AtMDAxIgogIGNsdXN0ZXI6CiAgICBzZXJ2ZXI6ICJodHRwczovL2Rldm9wcy5zdGVmYW5pbmkuaW8vazhzL2NsdXN0ZXJzL2MtcjZsbmQiCiAgICBpbnNlY3VyZS1za2lwLXRscy12ZXJpZnk6IHRydWUKdXNlcnM6Ci0gbmFtZTogImVrcy1kZXZvcHMtZGV2ZWxvcC0wMDEiCiAgdXNlcjoKICAgIHRva2VuOiAia3ViZWNvbmZpZy11LXB3cHhwOnQyOTU4cWd3bjl3em1sMnZoY3N4NjYyZG5ucXM0a3A4ODh6N2ZrODJkbXRzdGI2cG1tNTRjNyIKCmNvbnRleHRzOgotIG5hbWU6ICJla3MtZGV2b3BzLWRldmVsb3AtMDAxIgogIGNvbnRleHQ6CiAgICB1c2VyOiAiZWtzLWRldm9wcy1kZXZlbG9wLTAwMSIKICAgIGNsdXN0ZXI6ICJla3MtZGV2b3BzLWRldmVsb3AtMDAxIgoKY3VycmVudC1jb250ZXh0OiAiZWtzLWRldm9wcy1kZXZlbG9wLTAwMSIK

RUN apk update && apk add --update --no-cache \
        curl=7.67.0-r0 \
        openssl=1.1.1d-r3 \
        figlet=2.2.5-r0 \
        fzf=0.19.0-r1 \
        bash=5.0.11-r1  && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && mkdir -p /root/.kube

RUN curl -LO https://raw.githubusercontent.com/lpmatos/kubeclt-context-manager/master/docker-install.sh && \
    chmod +x ./docker-install.sh && bash ./docker-install.sh

ENTRYPOINT []

CMD [ "manager", "help" ]
