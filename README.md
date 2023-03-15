# Shopping Cart Microservice

This is a Go REST API microservice for a typical shopping cart. The microservice has the following routes:

| # | HTTP Method | Endpoint            | Description                        |
| - | ----------- | ------------------- | ---------------------------------- |
| 1 | GET         | `/`                 | Base route                          |
| 2 | GET         | `/items`            | Returns a list of cart items        |
| 3 | POST        | `/items`            | Creates a new cart item             |
| 4 | GET         | `/item/{id}`        | Returns an item with the given `id` |
| 5 | PUT         | `/item/{id}`        | Updates an item with the given `id` |
| 6 | DELETE      | `/item/{id}`        | Removes an item from the cart with the given `id` |

## Running the app

To run the code, you need to build the application first. Run the command below to build the executable:

```bash
go get && go build
```

Now, run the executable:

```bash
./main
```

## Building the Docker image

To build the docker image, navigate to the root directory of the repo and run the command below:

```bash
docker build -t <your name>/shopping-cart-microservice .
```

Replace <your name> with your dockerhub username. If you are pushing to a different registry, you might want to remove the <your name> section entirely.

After building the image, you can run it using the command below:

```bash
docker run -p 8081:8080 <your name>/shopping-cart-microservice
```

This builds a docker container and runs it with port 8081 forwarded. If you open localhost:8081, you should see `Shopping Cart Microservice`.

## Deploying using Kubernetes

You can deploy the microservice using Kubernetes. First, you want to get Kubernetes running using Minikube, Kind, Docker Desktop, etc. Then, you'd want to apply the manifest. Run the command below to apply the manifest:

```bash
kubectl apply -f shopping-cart.yaml
```

This create a Kubernetes manifest and exposes port 8080 through a service.


Expose the deployment using this command:

```bash
kubectl expose deployment shopping-cart-deployment --type=LoadBalancer --port=80 --target-port=8080
```

Get the exposed URL using the command below:

```bash
minikube service shopping-cart-service --url
```

