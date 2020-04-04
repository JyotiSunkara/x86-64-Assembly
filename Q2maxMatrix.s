.text

.global max

max:  # rdi,rsi,rdx
   movq $1,%rbx       
   imulq %rsi,%rbx            # %rbx = %rsi * %rdx
   imulq %rdx,%rbx
   mov (%rdi),%rax            # %rax = [%rdi]
   dec %rbx                   # %rbx --
   cmpq $0,%rbx               # %rbx < 0 out?
   jl .OUT      
.LOOP:
   movq (%rdi,%rbx,8),%rcx    # %rcx = [%rdi + 8 * %rbx]
   cmpq %rax, %rcx            # %rcx <= %rax ??
   jle .skip
   movq %rcx, %rax            # %rax = %rcx
.skip:
   dec %rbx
   cmpq $0,%rbx
   jge .LOOP   
.OUT:
   ret
 
  
