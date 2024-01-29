# Utilisez une image de base prenant en charge COBOL
FROM debian:latest

# Installez le compilateur COBOL
RUN apt-get update && apt-get install -y open-cobol

# Copiez les fichiers source COBOL dans l'image
COPY calculator.cbl /app/calculator.cbl
COPY testCalculator.cbl /app/testCalculator.cbl

WORKDIR /app

RUN sed -i 's/deb.debian.org/mirrors.ubuntu.com/g' /etc/apt/sources.list

RUN cobc -free -x -o Calculator calculator.cbl

RUN cobc -free -x -o CalculatorTest testCalculator.cbl


CMD ["./Calculator"]

