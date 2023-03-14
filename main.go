package main

import (
	"net/http"

	"github.com/vicradon/simple-go-service/api"
)

func main() {
	srv := api.NewServer() 
	http.ListenAndServe(":8080", srv)
}
