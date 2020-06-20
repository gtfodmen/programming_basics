PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Cross = 'X';
  Space = ' ';
  RowsCount = 5;
  CellsCount = 5;
  Min = 1;
  Max = RowsCount * CellsCount;
TYPE
  SETINT = SET OF Min..Max;
VAR
  Alphabet: SET OF CHAR;
  Ch: CHAR; 
  Encoding: SETINT;

PROCEDURE PrintSymbol(EncryptedLetter: SETINT);        
VAR
  I: INTEGER;
BEGIN {PrintSymbol}
  FOR I := Min TO Max
  DO
    BEGIN
      IF I IN EncryptedLetter
      THEN
        WRITE(Cross)
      ELSE
        WRITE(Space);
      IF I MOD CellsCount = 0
      THEN
        WRITELN
    END
END; {PrintSymbol}

FUNCTION GetLetterMatrix(Letter: CHAR): SETINT;
BEGIN
  CASE Letter OF
    'a', 'A': GetLetterMatrix := [3, 7, 9, 11, 15, 16..21, 25];
    'b', 'B': GetLetterMatrix := [1..4, 6, 9, 11..15, 16, 20..25];
    'c', 'C': GetLetterMatrix := [2..4, 6, 10, 11, 16, 20, 22..24];
    'd', 'D': GetLetterMatrix := [1..4, 6, 10, 11, 15, 16, 20..24];
    'e', 'E': GetLetterMatrix := [1..6, 11..16, 21..25];
    'f', 'F': GetLetterMatrix := [1..6, 11..16, 21];
    'g', 'G': GetLetterMatrix := [2..6, 11, 14..16, 20, 22..25];
    'h', 'H': GetLetterMatrix := [1, 5, 6, 10..16, 20, 21, 25];
    'i', 'I': GetLetterMatrix := [2..4, 8, 13, 18, 22..24];
    'j', 'J': GetLetterMatrix := [1..5, 10, 15, 16, 20, 22..24];
    'k', 'K': GetLetterMatrix := [1, 5, 6, 9, 11..13, 16, 19, 21, 25];
    'l', 'L': GetLetterMatrix := [1, 6, 11, 16, 21..25];
    'm', 'M': GetLetterMatrix := [1, 5..7, 9..11, 13, 15, 16, 20, 21, 25];
    'n', 'N': GetLetterMatrix := [1, 5..7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'o', 'O': GetLetterMatrix := [2..4, 6, 10, 11, 15, 16, 20, 22..24];
    'p', 'P': GetLetterMatrix := [1..6, 10..16, 21];
    'q', 'Q': GetLetterMatrix := [2..4, 6, 10, 11, 15, 17..19, 24, 25];
    'r', 'R': GetLetterMatrix := [1..6, 10..16, 19, 21, 25];
    's', 'S': GetLetterMatrix := [1..6, 11..15, 20..25];
    't', 'T': GetLetterMatrix := [1..5, 8, 13, 18, 23];
    'u', 'U': GetLetterMatrix := [1, 5, 6, 10, 11, 15, 16, 20, 22..24];
    'v', 'V': GetLetterMatrix := [1, 5, 6, 10, 12, 14, 17, 19, 23];
    'w', 'W': GetLetterMatrix := [1, 5, 6, 10, 11, 13, 15..17, 19..21, 25];
    'x', 'X': GetLetterMatrix := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'y', 'Y': GetLetterMatrix := [1, 5, 7, 9, 13, 18, 23];
    'z', 'Z': GetLetterMatrix := [1..5, 9, 13, 17, 21..25]
    ELSE
      GetLetterMatrix := []
  END
END;

BEGIN {XPrint}
  Ch := ' ';
  Alphabet := ['a'..'z', 'A'..'Z'];
  Encoding := [];
  WRITE('Enter an English leter: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch);
      Encoding := GetLetterMatrix(Ch);
      IF Encoding = []
      THEN
        WRITELN('It''is not english letter')
      ELSE
        BEGIN
          WRITELN('Your graphic letter is: ');         
          PrintSymbol(Encoding)
        END
    END
END. {XPrint}