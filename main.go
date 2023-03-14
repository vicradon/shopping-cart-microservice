package main

import (
	"net/http"

	"github.com/vicradon/shopping-cart-microservice/api"
)

func main() {
	srv := api.NewServer() 
	http.ListenAndServe(":8080", srv)
}
