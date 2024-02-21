PROGRAM direct
  IMPLICIT NONE

  INTEGER :: unit
  REAL :: r
  INTEGER :: line

  OPEN( NEWUNIT=unit,  &
      FILE='direct.txt',  &
      STATUS='REPLACE',  &
      ACCESS='DIRECT',  &
      RECL=15,  &      ! The fixed record length.
      FORM='FORMATTED' )

  CALL RANDOM_SEED()

  ! No need to write records in order - we just leave off 
  ! writing the first record until the end.

  line = 0
  DO
    CALL RANDOM_NUMBER(r)
    IF (r < 0.05) EXIT

    line = line + 1
    PRINT "('Writing line ',I0)", line
    ! All the "data" records are offset by one, to allow the 
    ! first record to record the line count.
    WRITE (unit, "('line ',I10)", REC=line+1) line
  END DO

  ! Now update the first record with the number of following "lines".
  WRITE (unit, "(I10)", REC=1) line

  CLOSE(unit)
END PROGRAM direct