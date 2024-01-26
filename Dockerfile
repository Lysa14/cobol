# Utilisez une image de base prenant en charge COBOL
FROM debian:latest

# Copiez les fichiers source COBOL dans l'image
COPY Calculator.cbl /app/Calculator.cbl
COPY CalculatorTest.cbl /app/CalculatorTest.cbl

WORKDIR /app

RUN cobc -free -x -o Calculator Calculator.cbl

RUN cobc -free -x -o CalculatorTest CalculatorTest.cbl


CMD ["./Calculator"]

