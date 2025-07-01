FROM amazonlinux:2023

RUN yum update -y && \
    yum install -y unzip tar gzip && \
    yum clean all

# kubectl 버전 변수 설정 및 설치
RUN curl -LO "https://dl.k8s.io/release/v1.30.1/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm -f kubectl
    
# AWS CLI 설치
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip

ENTRYPOINT ["/bin/sh"]