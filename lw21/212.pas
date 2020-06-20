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
VAR
  ChiperFile: TEXT;
  RealLetter, ChiperLetter: CHAR;
BEGIN {Initialization}
  FOR RealLetter := 'A' TO 'Z'
  DO 
    Code[RealLetter] := RealLetter;
  ASSIGN(ChiperFile, 'chiperfile.txt');
  RESET(ChiperFile);
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      WHILE NOT EOLN(ChiperFile)
      DO
        BEGIN
          READ(ChiperFile, RealLetter);
          IF NOT EOLN(ChiperFile)
          THEN
            READ(ChiperFile, ChiperLetter);
          IF NOT EOLN(ChiperFile)
          THEN
            READ(ChiperFile, ChiperLetter);
          IF RealLetter IN ChiperAlphabet
          THEN
            Code[RealLetter] := ChiperLetter
        END;
      READLN(ChiperFile)
    END
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