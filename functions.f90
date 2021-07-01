! This shows how a function works

FUNCTION do_smt(i) result(j)
    ! multiply a number by 2
    IMPLICIT NONE
    INTEGER, intent(in) :: i
    INTEGER :: j
    j = i * 2
    RETURN
END FUNCTION

PROGRAM funcs
    IMPLICIT NONE
    INTEGER :: i
    INTEGER :: do_smt !
    DO i = 1, 10
        print *, "result for", i, " is ", do_smt(i)
    END DO
END PROGRAM
