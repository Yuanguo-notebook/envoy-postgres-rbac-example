# envoy-postgres-rbac-example

this example demonstrates envoy's postgres filter with tls and rbac validation. the flow is:

postgres client --plain--> [egress sidecar(10000)] --tls-->[ingress sidecar(1999)] --> postgresdb

where we check rbac at ingress sidecar.

create certs following https://www.envoyproxy.io/docs/envoy/latest/start/sandboxes/double-proxy

start docker:
```
docker compose up --build -d

send traffic:
```
PGPASSWORD=postgres psql -d 'postgresql://postgres@localhost:10000/postgres?sslmode=disable' -f scripts/create_table.sql 

PGPASSWORD=postgres psql -d 'postgresql://postgres@localhost:10000/postgres?sslmode=disable' -f scripts/operation.sql 
```
