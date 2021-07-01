!
! This is not actually a "game". 
! But you can move the character around :)
!

SubRoutine cls()
    ! clear screen
    print *, achar(27)//"[2J"
End SubRoutine


SubRoutine draw(x_pos)
    ! Draw the map and the character
    ! It's just a one line map. For two dimensions we could use a matrix
    INTEGER, intent(in) :: x_pos
    CHARACTER, dimension(80) :: map
    INTEGER i, obstacle
    obstacle = 35
    DO i = 1, 80
        IF (i .EQ. x_pos) THEN
            map(i) = '#'
        ELSE IF (i .EQ. obstacle) THEN
            map(i) = '$'
        ELSE
            map(i) = ' '
        END IF
    END DO
    call cls()
    print *, "map", map
End SubRoutine


SubRoutine move(direction_x, x_pos)
    ! Move the character around
    external draw
    INTEGER, intent(in) :: direction_x
    INTEGER, intent(inout) :: x_pos
    x_pos = x_pos + direction_x
    if (x_pos < 1) THEN
        x_pos = 1
    ELSE IF (x_pos > 79) THEN
        x_pos = 80
    ENDIF
    call draw(x_pos)
    ! print *, "move ", direction_x, x_pos
End SubRoutine


Function key_input() result(key)
    ! Read the input from keyboard
    ! TODO it should read a single char
    CHARACTER(len=1) :: key
    READ(*, FMT='(A1)') key
    ! print *, "you pressed key ", key
End Function

Program game
    ! Simplistic demonstrative game in Fortran
    ! Move the character to make him exercise :)
    external move
    external cls
    CHARACTER(len=1) :: key_input ! declare the function
    CHARACTER(len=1) :: key ! char from keyboard
    INTEGER :: x_pos ! character position
    x_pos = 1
    print *, "Use 'a' and 'd' to move the character. Then hit Enter.\n Use 'q' to stop."
    DO while (key .ne. 'q')
        key = key_input()
        SELECT CASE (key)
            CASE ('a')
                call move(-1, x_pos)
            CASE ('d')
                call move(1, x_pos)
        END SELECT
    END DO
End Program




