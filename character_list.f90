program character_list
implicit none
character::char
integer::i
call system("CHCP 65001")
print *, "Change font of cmd to CONSOLAS if cant view Vietnamese character!!"
print *, "Ấn 1 phím chữ cái bất kỳ để biết mã ID của nó"
read "(a)", char
!print "(a12, a3, a5, i3)", "Mã ID của ", char," là ", ichar(char)
print *, "Mã ID của ", char," là ", ichar(char)
call system("pause -1")
print *, "ngoài ra có thể tham khảo bảng bên dưới !! "
call system("CHCP 437")
do i=1,255,1
print *,  achar(i), i
end do 
call system("pause -1")

contains
subroutine show_char_id
      implicit none
      integer::i
      do  i=1,255,1
      print "(i3, 6x, a3)",  i, i
      end do
      call system("pause")
end subroutine show_char_id

end program character_list
 