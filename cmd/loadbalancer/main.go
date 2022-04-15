package main

import loadbalancer "loadbalancer/internal"

func main() {
	loadbalancer.Start(":8080")
}
