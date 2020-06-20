PROGRAM DisplayWord(INPUT, OUTPUT);
CONST
  MaxLength = 10;
TYPE
  SETINT = SET OF 1..25;
  Alphabet = 'A'..'Z';
VAR
  LetterFromAlphabet: Alphabet;
  Ch: CHAR; 
  Encoding: SETINT;
  Matrix: FILE OF SETINT;
  I: INTEGER;
  Length: INTEGER;

PROCEDURE PrintSymbol(EncryptedLetter: SETINT);        
VAR
  Cross, Space: CHAR;
  I, Count: INTEGER;
BEGIN {PrintSymbol}
  Cross := 'X';
  Space := ' ';
  Count := 0;
  FOR I := 1 TO 25
  DO
    BEGIN
      Count := SUCC(Count);
      IF I IN EncryptedLetter
      THEN
        WRITE(Cross)
      ELSE
        WRITE(Space);
      IF Count = 5
      THEN
        BEGIN
          WRITELN;
          Count := 0
        END
    END
END; {PrintSymbol}

BEGIN {DisplayWord}
  WRITE('Enter a word up to ten letters in uppercase: ');
  Ch := ' ';
  Encoding := [];
  ASSIGN(Matrix, 'matrix.txt');
  Length := 0;
  WHILE NOT EOLN AND (Length < MaxLength)
  DO
    BEGIN
      LetterFromAlphabet := 'A';
      RESET(Matrix);
      READ(Ch);
      Length := Length + 1;
      FOR I := 1 TO 26
      DO
        BEGIN
          READ(Matrix, Encoding);
          IF Ch = LetterFromAlphabet
          THEN
            BEGIN
              PrintSymbol(Encoding);
              WRITELN;
              BREAK
            END
          ELSE
            LetterFromAlphabet := SUCC(LetterFromAlphabet)
        END
    END    
END. {DisplayWord}