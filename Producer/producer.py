from confluent_kafka import Producer, KafkaError

# Configuración de seguridad
conf = {
    'bootstrap.servers': 'kafka:29092',  # Cambia la dirección y puerto si es necesario
    'security.protocol': 'SSL',
    'ssl.keystore.location': '/certs/kafka-client.p12',
    'ssl.keystore.password': 'contraseña_cliente',  # Reemplaza con la contraseña correcta
    'ssl.keystore.type': 'PKCS12',
    'ssl.ca.location': '/certs/ca.p12' # CA certificate file for verifying the broker's certificate.
}

# Crea un productor con la configuración de seguridad
producer = Producer(conf)

# Función de manejo de entrega
def delivery_report(err, msg):
    if err is not None:
        print('Mensaje entrega fallida: {}'.format(err))
    else:
        print('Mensaje entregado a {} [{}]'.format(msg.topic(), msg.partition()))

# Produce mensajes en un topic
topic = 'my_topic'  # Reemplaza con el nombre de tu topic
for i in range(1000):
    message_value = 'Mensaje {}'.format(i)
    producer.produce(topic, key=str(i), value=message_value, callback=delivery_report)

# Espera a que todos los mensajes se entreguen o se produzca un error
producer.flush()