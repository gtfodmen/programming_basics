PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  I: INTEGER;
PROCEDURE ReadDigit(VAR InF: TEXT; VAR Digit: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  READ(InF, Ch);
  Digit := -1;
  IF (Ch = '0') THEN Digit := 0 ELSE
  IF (Ch = '1') THEN Digit := 1 ELSE
  IF (Ch = '2') THEN Digit := 2 ELSE
  IF (Ch = '3') THEN Digit := 3 ELSE
  IF (Ch = '4') THEN Digit := 4 ELSE
  IF (Ch = '5') THEN Digit := 5 ELSE
  IF (Ch = '6') THEN Digit := 6 ELSE
  IF (Ch = '7') THEN Digit := 7 ELSE
  IF (Ch = '8') THEN Digit := 8 ELSE
  IF (Ch = '9') THEN Digit := 9
END;{ReadDigit}
PROCEDURE ReadNumber(VAR InF: TEXT; VAR Number: INTEGER);
VAR
  Ch: CHAR;
  TemporaryDigit: INTEGER; 
BEGIN{ReadNumber}          
  Number := 0; 
  WHILE (NOT EOLN) AND (TemporaryDigit <> -1) AND (Number <> -1)
  DO
    BEGIN
      ReadDigit(InF, TemporaryDigit);
      IF TemporaryDigit <> -1 
      THEN
        IF (Number < MAXINT DIV 10)
        THEN
          Number := (Number * 10) + TemporaryDigit
        ELSE
          IF (TemporaryDigit <= MAXINT MOD 10) AND (Number = MAXINT DIV 10)
          THEN
            Number := (Number * 10) + TemporaryDigit
          ELSE
            Number := -1
    END; 
END;{ReadNumber}
BEGIN{TestReadNumber }
  I := 0;
  ReadNumber(INPUT, I);
  WRITELN(I)
END.{TestReadNumber}