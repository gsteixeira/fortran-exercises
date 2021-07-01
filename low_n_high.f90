! given a random sequence, find the lowest and highest number

SUBROUTINE populate_array(vector)
    ! Populate an array with random numbers
    INTEGER, intent(inout) :: vector(20)
    INTEGER :: i
    REAL :: num
    DO i = 1, size(vector)
        call random_number(num)
        vector(i) = FLOOR(num * 1000)
        print *, "val", vector(i)
    END DO
END SUBROUTINE

PROGRAM LowNHigh
    ! Find the low and high values of an array
    IMPLICIT NONE
    INTEGER :: array(20)
    INTEGER :: low, i, high
    external populate_array
    ! populate the array with random numbers
    call populate_array(array)
    low = array(1)
    DO i = 1, size(array)
        ! find the lower
        IF (array(i) < low) THEN
            low = array(i)
        END IF
        ! find the highest
        IF (array(i) > high) THEN
            high = array(i)
        END IF
    END DO
    print *, "the lowest number is ", low
    print *, "the highest number is ", high
END PROGRAM
