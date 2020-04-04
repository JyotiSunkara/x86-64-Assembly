.text

.global sum2d

sum2d:  # rdi,rsi,rdx
  movq $1,%rbx       
  imulq %rsi,%rbx             # %rbx = %rsi * %rdx
  imulq %rdx,%rbx
  mov $0,%rax                 # %rax = 0
  dec %rbx                    # %rbx --
  cmpq $0,%rbx                # %rbx < 0 out?
  jl .OUT      
.LOOP:
   movq (%rdi,%rbx,8),%rcx    # %rcx = [%rdi + 8 * %rbx]
   movq %rcx,%r10             # %r10 = %rcx
   andq $1,%rcx               # %rcx &= 1
   cmpq $0,%rcx               # %rcx == 0 (even)
   jne .skip
   addq %r10,%rax
.skip:
   dec %rbx
   cmpq $0,%rbx
   jge .LOOP   
.OUT:
   ret
 
  
