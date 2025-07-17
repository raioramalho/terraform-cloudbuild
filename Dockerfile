# Usa a imagem oficial leve do Cloud SDK
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:slim

# Instala dependências e Terraform
RUN apt-get update && apt-get install -y --no-install-recommends \
    unzip curl gnupg software-properties-common \
    google-cloud-cli-gke-gcloud-auth-plugin && \
    curl -Lo terraform.zip https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_linux_amd64.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform.zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
