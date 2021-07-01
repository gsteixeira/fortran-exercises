! Shows the use of command line arguments
!   print a sequence from argument A to arg B
PROGRAM fargs
  INTEGER :: i
  INTEGER :: a, b
  CHARACTER(len=32) :: arg_a
  CHARACTER(len=32) :: arg_b
  ! get the arguments
  CALL getarg(1, arg_a)
  CALL getarg(2, arg_b)
  ! cast the String to Integer
  READ(arg_a, *) a
  READ(arg_b, *) b
  print *, "You passed #", iargc(), " arguments", arg_a, arg_b
  DO i = a, b
    print *, i
  END DO
END PROGRAM
