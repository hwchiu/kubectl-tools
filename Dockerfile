#####

FROM alpine:3.12
LABEL MAINTAINER hungwei@opennetworking.org

RUN apk --no-cache add bash
RUN apk --no-cache add --update curl ca-certificates
RUN apk --no-cache add jq gettext

RUN curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl \
        && install kubectl -m 755 /usr/local/bin/ \
        && curl -kfsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
        && chmod 700 get_helm.sh \
        && VERIFY_CHECKSUM=false ./get_helm.sh \
        && curl -LO https://github.com/josephburnett/jd/releases/download/v1.4.0/jd-amd64-linux \
        && install jd-amd64-linux -m 755 /usr/local/bin/jd

COPY entrypoint.bash ./
ENTRYPOINT ["/bin/bash", "./entrypoint.bash"]
