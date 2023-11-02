# Utiliza la imagen base de Python
FROM python:3.9

# Establece el directorio de trabajo
WORKDIR /app

# Copia el código de la aplicación
COPY ./Producer/producer.py /app
COPY ./Producer/requirements.txt /app

# Instala las bibliotecas requeridas
RUN pip install -r requirements.txt

# Ejecuta la aplicación
CMD ["python", "producer.py"]