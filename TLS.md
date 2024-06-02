# Only TLS1.2 and TLS1.3

## Should connect
- curl -I -v --tlsv1.2 --tls-max 1.2 https://localhost
- curl -I -v --tlsv1.3 --tls-max 1.3 https://localhost

## Should not connect
- curl -I -v --tlsv1.1 --tls-max 1.1 https://localhost
- curl -I -v --tlsv1 --tls-max 1.0 https://localhost