# Terraform GCP Builder (Cloud Build)

Este projeto define uma imagem Docker customizada com o Google Cloud SDK, Terraform e o plugin de autenticação do GKE, usada em pipelines do Cloud Build para aplicar infraestrutura GCP com Terraform.

## 🔧 O que está incluído na imagem

- `gcloud` CLI (Cloud SDK)
- Plugin `gke-gcloud-auth-plugin`
- `terraform` 1.8.4
- Dependências essenciais (curl, unzip, etc)

## 📂 Estrutura

```
.
├── Dockerfile                 # Imagem customizada com Terraform + GCP SDK
├── cloudbuild.yaml           # Pipeline para build/push da imagem e execução de teste
└── infra/
    └── test/                 # Módulo Terraform de teste com GKE
        ├── main.tf
        └── variables.tf
```

## 🚀 Como usar

### 1. Build da imagem customizada

O pipeline `cloudbuild.yaml` já está preparado para:

- Buildar a imagem Docker com Terraform
- Fazer push para o Container Registry do projeto
- Rodar um teste Terraform com o provider GKE (sem criar nada)

Execute:

```bash
gcloud builds submit --config cloudbuild.yaml
```

### 2. O que o teste faz?

A etapa de teste executa:

- `terraform init` + `validate` + `plan`
- Usando um recurso `google_container_cluster` com `count = 0` (não cria cluster)
- Verifica se o Terraform, o provider Google e o auth com GCP estão funcionando corretamente

### 🧪 Teste local da imagem (opcional)

```bash
docker build -t terraform-gcp-test .
docker run -it terraform-gcp-test terraform version
```

---

## 📌 Requisitos

- Projeto GCP com o Cloud Build habilitado
- Permissões adequadas para usar GKE via Terraform
- Billing ativado (para testes reais, não necessário neste cenário)!!!

---

## 📄 Licença

MIT