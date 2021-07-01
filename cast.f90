! Shows data conversion from INT to String and vice versa

PROGRAM casting
  INTEGER :: i
  CHARACTER(len=32) :: text
  ! cast Integer to String
  i = 123
  WRITE(text, *) i
  print *, "Integer to text", text
  ! cast String to Integer
  text = "456"
  READ(text, *) i
  print *, "Convert to integer", i  
END PROGRAM
