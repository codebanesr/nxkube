## Append the following to /etc/hosts
127.0.0.1       mongo1
127.0.0.1       mongo2
127.0.0.1       mongo3


## Final uri will look something like the following
`mongodb://mongo1:27021,mongo2:27022,mongo3:27023/?replicaSet=my-replica-set`
