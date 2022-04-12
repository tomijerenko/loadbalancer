.PHONY: default usage build run build-release build-run build-release-run

usage:
	@echo "Please provide an option:"
	@echo "	make build		--- Build the app"
	@echo "	make run		--- Run the app"
	@echo "	make build-release	--- Build with optimization flags enabled"
	@echo "	make build-run		--- Build and run"
	@echo "	make build-release-run	--- Build with optimization flags enabled and run"

build:
	go build -o loadbalancer cmd/loadbalancer/main.go

run:
	go run cmd/loadbalancer/main.go

build-release:
	go build -o loadbalancer -ldflags "-s -w" cmd/loadbalancer/main.go

build-run: build run

build-release-run: build-release run

default: usage
