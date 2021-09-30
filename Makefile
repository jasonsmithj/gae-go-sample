.PHONY: build deploy

build:
	go fmt ./...
	go vet ./...
	GOOS=linux GOARCH=amd64 go build -o ./.artifacts/gae-go-sample-amd64 ./cmd/gae-go-sample/main.go
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f docker-compose.yaml build --no-cache --parallel

up:
	docker-compose up -d

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f
