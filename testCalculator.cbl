IDENTIFICATION DIVISION.
PROGRAM-ID. CalculatorTest.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM1            PIC 9(5) VALUE 5.
01 NUM2            PIC 9(5) VALUE 7.
01 EXPECTED-RESULT PIC 9(6) VALUE 12.
01 ACTUAL-RESULT   PIC 9(6).

PROCEDURE DIVISION.

    DISPLAY "Running CalculatorTest...".

    PERFORM TestAddition.

    DISPLAY "CalculatorTest finished.".

    STOP RUN.

TestAddition.

    DISPLAY "Running TestAddition...".
    MOVE NUM1 TO RESULT-NUM1.
    MOVE NUM2 TO RESULT-NUM2.

    CALL 'Calculator' USING RESULT-NUM1 RESULT-NUM2.

    ADD RESULT-RESULT TO ACTUAL-RESULT.

    IF ACTUAL-RESULT EQUAL TO EXPECTED-RESULT
        DISPLAY "TestAddition Passed"
    ELSE
        DISPLAY "TestAddition Failed".

    DISPLAY "TestAddition finished.".

    EXIT PROGRAM.

