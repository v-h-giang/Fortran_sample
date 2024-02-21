PROGRAM stream
  IMPLICIT NONE

  INTEGER :: unit
  REAL :: r
  INTEGER :: line
  INTEGER :: pos

  OPEN( NEWUNIT=unit,  &
      FILE='stream.txt',  &
      STATUS='REPLACE',  &
      ACCESS='STREAM',  &
      POSITION='REWIND',  &
      FORM='FORMATTED' )

  CALL RANDOM_SEED()

  ! Remember where we are.  In this case, the position 
  ! is the first file storage unit in the file, but 
  ! it doesn't have to be.
  INQUIRE(unit, POS=pos)

  ! Leave some space in the file for later overwriting 
  ! with the number of lines.  We'll stick the number 
  ! zero in there for now.
  WRITE (unit, "(I10)") 0

  ! Write out the varying number of lines.
  line = 0
  DO
    CALL RANDOM_NUMBER(r)
    IF (r < 0.05) EXIT

    line = line + 1
    PRINT "('Writing line ',I0)", line
    WRITE (unit, "('line ',I10)") line
    INQUIRE(unit, POS=pos)
    PRINT *, "pos line  " , line, " = ",  pos
  END DO

  ! Now update the space at the start with the number of following "lines".
  WRITE(unit,'(I2)', POS=pos - 17) line

  CLOSE(unit)
END PROGRAM stream