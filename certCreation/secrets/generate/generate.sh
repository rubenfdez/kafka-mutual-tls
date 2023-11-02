#!/bin/bash

# Definir las contraseñas para los certificados
CA_PASSWORD="contraseña_ca"
SERVER_PASSWORD="contraseña_servidor"
CLIENT_PASSWORD="contraseña_cliente"

# Generar una clave privada para la CA
openssl genpkey -algorithm RSA -out files/ca-key.pem

# Crear un certificado autofirmado para la CA
openssl req -new -x509 -key files/ca-key.pem -out files/ca.pem -subj "/CN=CA" -passin pass:$CA_PASSWORD

# Generar una clave privada para el servidor
openssl genpkey -algorithm RSA -out files/server-key.pem

# Crear una solicitud de certificado para el servidor
openssl req -new -key files/server-key.pem -out files/server-csr.pem -subj "/CN=server" -passin pass:$SERVER_PASSWORD

# Firmar la solicitud de certificado del servidor con la CA
openssl x509 -req -in files/server-csr.pem -CA files/ca.pem -CAkey files/ca-key.pem -out files/server-cert.pem -CAcreateserial -passin pass:$CA_PASSWORD

# Generar una clave privada para el cliente
openssl genpkey -algorithm RSA -out files/client-key.pem

# Crear una solicitud de certificado para el cliente
openssl req -new -key files/client-key.pem -out files/client-csr.pem -subj "/CN=client" -passin pass:$CLIENT_PASSWORD

# Firmar la solicitud de certificado del cliente con la CA
openssl x509 -req -in files/client-csr.pem -CA files/ca.pem -CAkey files/ca-key.pem -out files/client-cert.pem -CAcreateserial -passin pass:$CA_PASSWORD

# Exportar los certificados y claves privadas en formato PKCS#12
openssl pkcs12 -export -out files/kafka-server.p12 -inkey files/server-key.pem -in files/server-cert.pem -certfile files/ca.pem -passin pass:$SERVER_PASSWORD -passout pass:$SERVER_PASSWORD
openssl pkcs12 -export -out files/kafka-client.p12 -inkey files/client-key.pem -in files/client-cert.pem -certfile files/ca.pem -passin pass:$CLIENT_PASSWORD -passout pass:$CLIENT_PASSWORD
openssl pkcs12 -export -out files/ca.p12 -inkey files/ca-key.pem -in files/ca.pem -passin pass:$CA_PASSWORD -passout pass:$CA_PASSWORD

# Limpieza: eliminar archivos temporales
rm -f files/server-csr.pem files/client-csr.pem files/ca.srl

cp -R files/kafka-server.p12 ../server
cp -R files/ca.p12 ../server
cp -R files/ca.p12 ../client
cp -R files/kafka-client.p12 ../client

echo "Certificados y claves generados con éxito."
