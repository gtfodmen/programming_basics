PROGRAM Encryption(INPUT, OUTPUT);
CONST
  MaxLen = 20;
  ChiperAlphabet = ['A'..'Z', ' '];
TYPE
  Str = ARRAY [1..MaxLen] OF 'A'..'Z';
  Chiper = ARRAY [' '..'Z'] OF CHAR;
  StringLength = 0..MaxLen;
VAR
  Msg: Str;
  Code: Chiper;
  Len: StringLength;
PROCEDURE InitializationOfChiper(VAR Code: Chiper);
BEGIN {Initialization}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := 'W';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'R';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := 'O';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := 'L';
  Code['P'] := 'K';
  Code['Q'] := 'J';
  Code['R'] := 'I';
  Code['S'] := 'H';
  Code['T'] := 'G';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'D';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '%';
END; {Initialization}
PROCEDURE Encode(VAR Msg: Str; VAR Code: Chiper; Len: StringLength);
VAR
  Index: 1..MaxLen;
BEGIN {Encode}
  FOR Index := 1 TO Len
  DO
    IF Msg[Index] IN ChiperAlphabet
    THEN
      WRITE(Code[Msg[Index]])
    ELSE
      WRITE(Msg[Index]);
  WRITELN
END; {Encode}
BEGIN {Encryption}
  InitializationOfChiper(Code);
  WHILE NOT EOF
  DO
    BEGIN
      Len := 0;
      WHILE NOT EOLN AND (Len < MaxLen)
      DO
        BEGIN
          Len := Len + 1;
          READ(Msg[Len]);
          WRITE(Msg[Len])
      END;
      READLN;
      WRITELN;
      Encode(Msg, Code, Len)
    END
END. {Encryption}