# Utilisez une image de base prenant en charge COBOL
FROM debian:latest

# Copiez les fichiers source COBOL dans l'image
COPY calculator.cbl /app/calculator.cbl
COPY testCalculator.cbl /app/testCalculator.cbl

WORKDIR /app

RUN cobc -free -x -o Calculator calculator.cbl

RUN cobc -free -x -o CalculatorTest testCalculator.cbl


CMD ["./Calculator"]

