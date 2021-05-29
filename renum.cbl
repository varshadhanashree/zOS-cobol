000010 IDENTIFICATION DIVISION.
000020 PROGRAM-ID. RENUM.
000030 ENVIRONMENT DIVISION.
000040 CONFIGURATION SECTION.
000050 SOURCE-COMPUTER.
000060     Linux.
000070 OBJECT-COMPUTER.
000080     Linux.
000090 INPUT-OUTPUT SECTION.
000100 FILE-CONTROL.
000110     SELECT   INPUT-FILE ASSIGN TO
000120     "infile"
000130     ORGANIZATION IS LINE SEQUENTIAL.
000140     SELECT   OUTPUT-FILE ASSIGN TO
000150     "outfile"
000160     ORGANIZATION IS LINE SEQUENTIAL.
000170 DATA DIVISION.
000180 FILE SECTION.
000190 FD  INPUT-FILE
000200     BLOCK CONTAINS 1 RECORDS.
000210 01  INREC.
000220     05  SEQNO PICTURE 9(6).
000230     05  FILLER PIC X(65).
000240 FD  OUTPUT-FILE
000250     BLOCK CONTAINS 1 RECORDS.
000260 01  OUTREC PICTURE X(72).
000270 WORKING-STORAGE SECTION.
000280 77 LINE-CNT PICTURE S9(6).
000290 PROCEDURE DIVISION.
000300     OPEN INPUT INPUT-FILE OUTPUT OUTPUT-FILE.
000310     MOVE 10 TO LINE-CNT.
000320 LOOP.
000330     READ INPUT-FILE AT END GO TO STOPIT.
000340     MOVE LINE-CNT TO SEQNO.
000350     ADD 10 TO LINE-CNT.
000360     WRITE OUTREC FROM INREC.
000370     GO TO LOOP.
000380 STOPIT.
000390     CLOSE INPUT-FILE OUTPUT-FILE.
000400          STOP RUN.
