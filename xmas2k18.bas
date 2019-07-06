    1  SY% = 1
    2  SX% = INT(WIDTH / 2)
    3  C% = 2
    4  T% = 0
    5  SD% = 0.05
    9  GOTO 100
   10  REM SUB PRINT A TRIANGLE
   20  IF DISABLE% = 0 THEN LOCATE SY%, SX% : PRINT "*"; : SLEEP SD%
   30  SY% = SY% + 1
   31  SX% = SX% - 1
   40  IF DISABLE% = 0 THEN LOCATE SY%, SX%: PRINT "/"; : SLEEP SD%
   50  SX% = SX% + 2
   60  IF DISABLE% = 0 THEN LOCATE SY%, SX%: PRINT "\"; : SLEEP SD%
   69  DISABLE% = 0
   70  RETURN
   80  REM SUB COMBINE THREE TRIANGLES TO ONE
   81  FOR II = 0 TO 2
   82  IF II = 1 THEN SY% = SY% + 1 : SX% = SX% + 1
   83  IF II = 2 THEN SX% = SX% - 5 : SY% = SY% - 1
   84  GOSUB 10
   85  NEXT II
   86  RETURN
  100  REM START
  110  GOSUB 80
  151  SY% = SY% + 1
  152  SX% = SX% + 5
  160  REM
  168  FOR CC = 1 TO C%
  169  IF CC <> 1 AND CC <> C% AND (C% = 3 OR C% = 5) THEN DISABLE% = 1
  170  GOSUB 80
  210  SX% = SX% - 7
  220  SY% = SY% - 3
  300  NEXT CC
  301  SY% = SY% + 4
  302  SX% = SX% + (C% * 10) - T%
  309  T% = T% + 2
  310  C% = C% + 1
  315  Q% = INT(HEIGHT / 4.5)
  320  IF C% > Q% THEN PRINT "" : SLEEP 2 : GOTO 410
  330  GOTO 168
  400  REM
  410  XX% = INT(WIDTH / 2) - 1
  420  LOCATE 9, XX% : PRINT "Hi"
  430  XX% = INT(WIDTH / 2) - INT(LEN(USER$) / 2)
  440  LOCATE 10, XX% : PRINT USER$ : SLEEP 2
  450  text$ = "Happy Christmas!"
  460  XX% = INT(WIDTH / 2) - (LEN(text$) / 2)
  470  LOCATE 17, XX% : PRINT text$
  480  SLEEP 2
