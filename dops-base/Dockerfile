##{
##  "name": "krkr/dops-base",
##}
FROM krkr/docker-toolbox

# Install Ansible
ENV ANSIBLE_VERSION 2.1.0.0
RUN apk --update add build-base python-dev libffi-dev \
    openssl-dev py-pip py-crypto py-yaml py-jinja2 openssh-client && \
    pip install ansible==${ANSIBLE_VERSION} && \
    apk del build-base python-dev openssl-dev libffi-dev

# Install Terraform
ENV TERRAFORM_VERSION 0.6.16
RUN apk --update add ca-certificates && \
    curl -sSkL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > /terraform.zip && \
    unzip /terraform.zip && rm /terraform.zip && \
    mv terraform* /usr/local/bin && \
    chmod +x /usr/local/bin/terraform*
