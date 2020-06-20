PROGRAM Digit(INPUT, OUTPUT);
CONST
  BorderOverflow = MAXINT DIV 10;
VAR
  Int: INTEGER;
PROCEDURE ReadNumber(VAR F: TEXT; VAR Sum: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа
 в соответствующее целое число N}
VAR
  RightDigit, LastDigitOfMAXINT: INTEGER;
  OVERFLOW: BOOLEAN;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{Считывает текущй символ из файла, если он - цифра, возвращает его
 преобразуя в значение типа INEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9  
      ELSE   {Считанный символ не цифра}
        D := -1
    END
  ELSE
    D := -1
END; {ReadDigit}

BEGIN {ReadNumber}
  LastDigitOfMAXINT := MAXINT MOD 10;
  RightDigit := 0;
  Sum := 0;
  OVERFLOW := FALSE;
  WHILE (RightDigit <> -1) AND (NOT OVERFLOW)  
  DO
    BEGIN
      ReadDigit(F, RightDigit);
      IF RightDigit <> -1
      THEN
        IF (Sum < BorderOverflow) OR ((Sum = BorderOverflow) AND (RightDigit <= LastDigitOfMAXINT))
        THEN
          Sum := Sum * 10 + RightDigit
        ELSE
          BEGIN
            OVERFLOW := TRUE;
            Sum := -1
          END
    END
END; {ReadNumber}

BEGIN {Digit}
  ReadNumber(INPUT, Int);
  WRITELN(Int)
END. {Digit}