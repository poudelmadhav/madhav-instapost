# Docker Setup

## Build image
```shell
docker build --platform linux/amd64 -t instapost .
```

## Set required environment variables
```shell
export SECRET_KEY_BASE="test-secret"
export DATABASE_URL="postgresql://postgres:password@localhost:5432/instapost_development"
```

## Run container
```shell
docker run --rm -it -p 3000:3000 --name=instapost-container \
  -e DATABASE_URL=$DATABASE_URL \
  -e SECRET_KEY_BASE=$SECRET_KEY_BASE \
  instapost
```

## Push Docker Image to Docker Hub
```shell
docker tag instapost:latest paudelmadhav/instapost:latest
docker push paudelmadhav/instapost:latest
```