# Utilisez une image de base prenant en charge COBOL
FROM debian:latest
#RUN sed -i 's/deb.debian.org/mirrors.ubuntu.com/g' /etc/apt/sources.list
# Installez le compilateur COBOL
#RUN apt-get update && apt-get install -y gnucobol
RUN apt-get update && \
    apt-get install -y gnucobol && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# Copiez les fichiers source COBOL dans l'image
COPY calculator.cbl /app/calculator.cbl
COPY testCalculator.cbl /app/testCalculator.cbl

WORKDIR /app



RUN cobc -free -x -o Calculator calculator.cbl

RUN cobc -free -x -o CalculatorTest testCalculator.cbl


CMD ["./Calculator"]

