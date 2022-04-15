.PHONY: default usage build run build-release

usage:
	@echo "Please provide an option:"
	@echo "	make build		--- Build the app"
	@echo "	make run		--- Run the app"
	@echo "	make build-release	--- Build with optimization flags enabled"

build:
	go build -o loadbalancer.out cmd/loadbalancer/main.go

run:
	go run cmd/loadbalancer/main.go

build-release:
	go build -o loadbalancer.out -ldflags "-s -w" cmd/loadbalancer/main.go

default: usage
