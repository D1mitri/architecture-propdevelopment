#!/bin/bash

openssl genrsa -out support-user.key 2048
openssl req -new -key support-user.key -out support-user.csr -subj "/CN=backend/O=learning/O=learning.org"
sudo openssl x509 -req -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -days 500 -in support-user.csr -out support-user.crt
kubectl config set-credentials support --client-certificate=support-user.crt --client-key=support-user.key

openssl genrsa -out developer-user.key 2048
openssl req -new -key developer-user.key -out developer-user.csr -subj "/CN=backend/O=learning/O=learning.org"
sudo openssl x509 -req -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -days 500 -in developer-user.csr -out developer-user.crt
kubectl config set-credentials developer --client-certificate=developer-user.crt --client-key=developer-user.key

echo "Users created: support, developer"