# Railway deployment (RAGFlow)

This repo includes a Railway-specific Dockerfile and entrypoint for a single-service RAGFlow web/API container.
Local Docker Compose remains unchanged.

## Files added
- `Dockerfile.railway`
- `docker/railway/start.sh`
- `docker/railway/ragflow.conf.template`
- `docker/railway/railway.env.example`
- `docker/railway/README.md`

## Railway build settings
Set **Dockerfile Path** to `Dockerfile.railway` so Railway does not use the default Dockerfile.

Optional: add `railway.toml` with:

```toml
[build]
builder = "DOCKERFILE"
dockerfilePath = "Dockerfile.railway"
```

## Required Railway services
- MySQL (Railway plugin)
- Redis (Railway plugin)
- Storage Bucket (S3-compatible)
- Elasticsearch (Railway template) or external ES

## Environment variables
Use `docker/railway/railway.env.example` as the source of truth for Railway variables.

Minimum required:
- `DB_TYPE=mysql`
- `RAGFLOW_SECRET_KEY` (32+ chars)
- `STORAGE_IMPL=AWS_S3`
- MySQL/Redis/Bucket/ES vars from the example file

## Deploy flow
1) Push to GitHub.
2) In Railway, set Dockerfile Path to `Dockerfile.railway`.
3) Add the four services and paste env vars.
4) Deploy.

## Local flow (unchanged)
```
cd docker
docker compose -f docker-compose.yml up -d
```
