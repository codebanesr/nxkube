# Building docker images
Run `docker-compose build` to build both frontend and backend images

# Mount volume into minikube vm if using minikube
`minikube start --mount --mount-string="/home/shanurrahman/Documents/personal/nxkube/conf.d:/tmp/nginx"`
format -> `minikube start --mount --mount-string="/host/path:/minikubeContainer/path"`

# Start making calls to backend through nginx
`curl http://192.168.49.2:30036/api/`