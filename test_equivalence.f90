program test_equivalence 
use ISO_FORTRAN_ENV
use, intrinsic :: iso_c_binding

type test_p1_type
    sequence
    integer (int16) :: int1
    integer (int16) :: int2
    integer (int32) :: int3
end type test_p1_type

type test_p2_type
   sequence
   integer (int16) :: int1
   integer (int16) :: int2
   integer (int32) :: int3
end type test_p2_type

type (test_p1_type) :: test_p1
type (test_p2_type) :: test_p2

INTEGER(c_long_long) :: ss 
TYPE(c_ptr) :: ss2 


equivalence (test_p1, test_p2)
test_p1 % int1 = 1
test_p1 % int2 = 0

test_p2 % int3 = 4


write (*,'(b16.16)') test_p1 % int1 
write (*,'(b16.16)') test_p1 % int2
write (*,'(b32.32)') test_p1 % int3

write (*,'(b16.16)') test_p2 % int1
write (*,'(b16.16)') test_p2 % int2
write (*,'(b32.32)') test_p2 % int3

end program test_equivalence