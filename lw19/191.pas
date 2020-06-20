PROGRAM Prime(INPUT, OUTPUT);
CONST
  StartRange = 2;
  EndRange = 100;
TYPE
  INTSET = SET OF StartRange..EndRange;
VAR
  Sieve: INTSET;
  Min, Max, Num, TempMax, TempMin: INTEGER;
  Proceed: BOOLEAN;
BEGIN {Prime}
  Proceed := TRUE;
  Sieve := [StartRange..EndRange];
  Min := StartRange;
  Max := EndRange;
  WHILE Proceed
  DO
    BEGIN
      Num := Min;
      TempMin := Min;
      TempMax := 0;
      WHILE Num <= Max
      DO
        BEGIN
          IF Num IN Sieve
          THEN
            IF Num MOD Min = 0
            THEN
              Sieve := Sieve - [Num]
            ELSE
              IF TempMin = Min
              THEN
                BEGIN            
                  TempMin := Num;
                  WRITE(Min, ', ')
                END
              ELSE
                TempMax := Num;
          Num := Num + 1
        END;
      Min := TempMin;
      IF Min = Max
      THEN 
        Proceed := FALSE
      ELSE
        Max := TempMax
    END;
  WRITELN(Max)
END. {Prime}