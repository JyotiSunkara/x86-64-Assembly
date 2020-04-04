.text

.global binarySearch

binarySearch:  # rdi:array, rsi:N, rdx:element
   movq $0, %rbx               # %rbx : first
   movq %rsi,%rcx              # %rcx : last
   decq %rcx
   # %rax : m 
   # %r10 : a[m] 
   movq %rcx, %rax
   cmpq %rcx, %rbx             # first last
   jg .END
.LOOP:
   movq %rbx, %rax
   addq %rcx, %rax
   shrq $1, %rax              # m = (first+last)>>1
   movq (%rdi,%rax,8),%r10
   cmpq %r10, %rdx
   je .done                    #this is working a[m]==el
   jl .ml  
   movq %rax,%rbx              #greater than f=m+1
   incq %rbx
   jmp .condCheck 
.ml:   
   movq %rax,%rcx              #less than l=m-1
   decq %rcx
.condCheck:
   cmpq %rcx, %rbx             # first<last
   jle .LOOP
.END:
   movq $-1, %rax
.done:
   ret
 
  
