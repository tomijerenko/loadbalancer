package main

import (
	loadbalancer "loadbalancer/internal"
	"os"
)

func main() {
	port := os.Args[1]
	loadbalancer.Start(port)
}
