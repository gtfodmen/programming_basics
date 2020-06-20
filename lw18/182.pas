PROGRAM AverageScore2(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  MinScore = 0;
  MaxScore = 100;
VAR
  Student, WhichScore, Ave, TotalScore, ClassTotal, NextScore: INTEGER;
  Ch: CHAR;
  OVERFLOW: BOOLEAN;
BEGIN {AverageScore2}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      OVERFLOW := FALSE;
      TotalScore := 0;
      WhichScore := 1;
      Ch := '#';
      WHILE (Ch <> ' ') AND (NOT EOLN)
      DO
        BEGIN
          READ(Ch);
          WRITE(Ch)
        END;
      WHILE (WhichScore <= NumberOfScores) AND (NOT EOLN) AND (NOT OVERFLOW)
      DO
        BEGIN
          READ(NextScore);   
          IF (NextScore >= MinScore) AND (NextScore <= MaxScore)
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
          ELSE
            OVERFLOW := TRUE
        END;
      READLN;
      IF NOT OVERFLOW
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1
        END
      ELSE
        WRITELN('неверное значение баллов, введите ещё раз')
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore2}