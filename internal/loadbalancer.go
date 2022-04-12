package loadbalancer

import (
	"log"
	"net/http"
	"net/http/httputil"
)

var tmp bool = false

func balance(request *http.Request) {
	request.URL.Scheme = "http"
	request.URL.Host = ":8081"

	if tmp {
		request.URL.Path = "/left"
		tmp = false
	} else {
		request.URL.Path = "/right"
		tmp = true
	}
}

func Start(address string) {
	reverseProxy := &httputil.ReverseProxy{
		Director: balance,
	}
	server := http.Server{
		Addr:    address,
		Handler: reverseProxy,
	}
	if err := server.ListenAndServe(); err != nil {
		log.Fatal(err.Error())
	}
}
