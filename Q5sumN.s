.text

.global sumN
sumN:                      #callee savee
    #get input in rdi
    #returns the sum of numbers n + n-1 + n-2 + ... +1 + 0 
    pushq %rbx             # save whatever n on the stack ; 
    movq  %rdi, %rbx       # %rbx now contains n
    movq  $0, %rax 	   # initialise sum
    cmpq  $0, %rbx         # n==0
    je .done
    leaq  -1(%rdi), %rdi   # n--
    call  sumN
    addq  %rbx, %rax       # sum=n+sum(n-1)
.done:
    popq  %rbx             # restore the original n ; 
    ret
