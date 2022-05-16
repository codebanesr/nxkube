# Building docker images
Run `docker-compose build` to build both frontend and backend images

# Mount volume into minikube vm if using minikube
`minikube start --mount --mount-string="/home/shanurrahman/Documents/personal/nxkube/conf.d:/tmp/nginx"`
format -> `minikube start --mount --mount-string="/host/path:/minikubeContainer/path"`
