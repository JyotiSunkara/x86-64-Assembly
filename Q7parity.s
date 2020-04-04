.text

.global parityCheck
parityCheck:
    #get input in rdi
    #returns one or zero in rax depending on the number of 1s
    # number of ones are stored in rax
    movq  %rdi, %rbx       # %rbx now contains N
    movq $0, %rax
    cmpq $0, %rbx          # N==0
    je .done
.loop:
    #we loop as follows while(n!=0)m=n&1;count+=m;n=n>>1;return count
    movq %rbx,%rcx         # m = n
    andq $1,%rcx           # m &= 1
    addq %rcx,%rax         # count+=m
    shrq $1,%rbx           # n/=2
    cmpq $0, %rbx          # N==0
    jne .loop
.done:
    movq %rax,%r9
    andq $1,%r9
    cmpq $0,%r9
    je .eqd
    jne .neqd
.eqd:
    movq $0,%rax
    ret
.neqd:
    movq $1,%rax
    ret
