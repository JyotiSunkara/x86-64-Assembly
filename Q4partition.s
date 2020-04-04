.text

.global partition
partition:   
   decq %rsi                   # %rsi : last=N-1
   movq (%rdi),%r8             # %r8 : pivot=a[0]
   movq $0, %rbx               # %rbx : i=0
   movq %rbx,%rcx              # %rcx : j=1
   incq %rcx                   
   cmpq %rsi,%rcx   
   jg .DONE
.loop:
   movq (%rdi,%rcx,8),%r9                #%r9: current=a[j]
   cmpq %r8,%r9                #if less than swap a[i+1] and a[j]
   jge .skip
   incq %rbx                   #i++
   movq (%rdi,%rbx,8),%r10
   movq (%rdi,%rcx,8),%r11
   movq %r10,(%rdi,%rcx,8)
   movq %r11,(%rdi,%rbx,8)
.skip:
   incq %rcx
   cmpq %rsi,%rcx
   jle .loop
.DONE:                         # swap a[0] and a[i]
   movq (%rdi),%r10
   movq (%rdi,%rbx,8),%r11
   movq %r10,(%rdi,%rbx,8)
   movq %r11,(%rdi)
   ret
