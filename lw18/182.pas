PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  Ave, TotalScore, ClassTotal, NextScore: INTEGER;
  Overflow: BOOLEAN;
  Name: TEXT;
PROCEDURE ReadName(VAR InputFile, OutputFile: TEXT);
VAR
  Ch: CHAR;
BEGIN { ReadName }
  IF NOT EOLN
  THEN
    BEGIN
      READ(InputFile, Ch);
      WRITE(OutputFile, Ch)
    END;
  WHILE (NOT EOLN(InputFile)) AND (Ch <> ' ')
  DO
    BEGIN
      READ(InputFile, Ch);
      WRITE(OutputFile, Ch)
    END;
  WRITELN(OutputFile)
END; { ReadName }
PROCEDURE WriteName(VAR InputFile, OutputFile: TEXT);
VAR
  Ch: CHAR;
BEGIN { WriteName }
  WHILE NOT EOLN(InputFile)
  DO
    BEGIN
      READ(InputFile, Ch);
      WRITE(OutputFile, Ch)
    END
END; { WriteName }
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  Overflow := FALSE;
  WHILE (Student < ClassSize) AND (NOT Overflow)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 0;
      Student := Student + 1;
      WRITE('Student ', Student, ': ');
      REWRITE(Name);
      ReadName(INPUT, Name);
      WHILE (WhichScore < NumberOfScores) AND (NOT Overflow)
      DO
        BEGIN
          READ(NextScore);
          Overflow := (NextScore < 0) OR (NextScore > 100);
          IF NOT Overflow
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
        END;
      READLN;
      IF NOT Overflow
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          RESET(Name);
          WriteName(Name, OUTPUT);
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore
        END;
    END;
  WRITELN;
  IF Overflow
  THEN
    WRITELN('Incorrect input data')
  ELSE
    BEGIN
      WRITELN ('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize *NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
END.  {AverageScore}