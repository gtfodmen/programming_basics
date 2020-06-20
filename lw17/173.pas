PROGRAM Stat(INPUT, OUTPUT);
{Для файла целых чисел, определяет минимальное, максимальное и среднее арифметическое}
VAR
  Int, Min, Max, Ave, Remains, Sum, NumberCount, MAXINT: INTEGER;
  OVERFLOW: BOOLEAN;
PROCEDURE ReadNumber(VAR F: TEXT; VAR Sum: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа
 в соответствующее целое число N}
VAR
  D, Count: INTEGER;
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
  Count := 0;
  MAXINT := 32767;
  D := 0;
  Sum := 0;
  OVERFLOW := FALSE;
  WHILE (D <> -1) AND (NOT OVERFLOW)  
  DO
    BEGIN
      ReadDigit(F, D);
      Count := Count + 1;
      IF D <> -1
      THEN
        IF Count <= 4
        THEN
          Sum := Sum * 10 + D
        ELSE
          BEGIN
            IF (Sum <= 3276) AND (D <= 7)
            THEN
              Sum := Sum * 10 + D
            ELSE
              BEGIN
                OVERFLOW := TRUE;
                Sum := -1
              END
          END
    END
END; {ReadNumber}
BEGIN {Stat}
  Int := 0;
  Min := 0;
  Max := 0;
  Ave := 0;
  Sum := 0;
  MAXINT := 32767;
  OVERFLOW := FALSE;
  IF NOT EOLN
  THEN
    ReadNumber(INPUT, Min);
  IF (NOT EOLN) AND (NOT OVERFLOW)
  THEN
    BEGIN
      ReadNumber(INPUT, Int);
      IF Int < Min
      THEN
        BEGIN
          Max := Min;
          Min := Int
        END
      ELSE
        Max := Int;
      IF Min <= MAXINT - Max
      THEN
        Sum := Min + Max
      ELSE
        OVERFLOW := TRUE;
      NumberCount := 2
    END;
  WHILE (NOT EOLN) AND (NOT OVERFLOW)
  DO
    BEGIN
      ReadNumber(INPUT, Int);
      IF Int < Min
      THEN
        Min := Int
      ELSE
        IF Int > Max
        THEN
          Max := Int;
      IF (Int <= MAXINT - Sum)
      THEN
        Sum := Sum + Int
      ELSE
        OVERFLOW := TRUE;
      NumberCount := NumberCount + 1;
    END;  
  IF NOT OVERFLOW
  THEN
    BEGIN
      Ave := Sum DIV NumberCount;
      WRITELN('Minimum: ', Min);
      WRITELN('Maximum: ', Max);
      WRITE('Avarage: ');
      IF Sum MOD NumberCount > 0
      THEN
        BEGIN
          Remains := Sum MOD NumberCount * 10;
          WRITELN(Ave, '.', Remains DIV NumberCount, Remains MOD NumberCount * 10 DIV NumberCount)
        END
      ELSE
        WRITELN(Ave)
    END
  ELSE
    WRITELN('OVERFLOW')
END. {Stat}