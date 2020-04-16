PROGRAM SumDigits(INPUT, OUTPUT);
VAR
  TemporaryDigit, Sum: INTEGER;  
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
BEGIN{SumDigits}
  Sum := 0;
  TemporaryDigit := 0;
  WHILE (NOT EOLN) AND (TemporaryDigit <> -1)
  DO
    BEGIN
      ReadDigit(INPUT, TemporaryDigit);
      IF TemporaryDigit <> -1
      THEN
        Sum := Sum + TemporaryDigit
    END;
  WRITELN('—ÛÏÏ‡:', Sum)
END.{SumDigits}