
#!/bin/bash
VERSION=1.1.0
AMBIENTE=dev
APP_NAME=compra
docker run -d --name=$APP_NAME-api -p=:8094:8080  --restart=always --network=qr$





