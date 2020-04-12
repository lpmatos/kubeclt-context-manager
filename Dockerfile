ARG ALPINE_VERSION=3.11
ARG KUBECONFIG=/root/.kube/config
ARG KUBECONFIG_CLUSTER

FROM alpine:${ALPINE_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com" \
        org.label-schema.version="1.0.0" \
        org.label-schema.release-data="12-04-2020" \
        org.label-schema.url="https://github.com/lpmatos" \
        org.label-schema.alpine="https://alpinelinux.org/" \
        org.label-schema.bash="https://www.gnu.org/software/bash/" \
        org.label-schema.kubectl="https://kubernetes.io/docs/tasks/tools/install-kubectl/" \
        org.label-schema.name="Kubectl Context Manager"

ENV KUBECONFIG=${KUBECONFIG} \
    KUBECONFIG_CLUSTER=${KUBECONFIG_CLUSTER}

RUN apk update && apk add --update --no-cache \
        curl=7.67.0-r0 \
        openssl=1.1.1d-r3 \
        figlet=2.2.5-r0 \
        fzf=0.19.0-r1 \
        bash=5.0.11-r1  && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl && mkdir -p /root/.kube

RUN curl -LO https://raw.githubusercontent.com/lpmatos/kubeclt-context-manager/master/setup/docker.sh && chmod +x ./docker.sh

ENTRYPOINT []

CMD []
