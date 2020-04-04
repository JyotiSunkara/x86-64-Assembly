.text

.global isPrime
isPrime:
    #get input in rdi
    #returns one or zero in rax depending on whether the rdi is prime or not
    movq  %rdi, %rbx       # %rbx now contains N
    cmpq $1, %rbx          # N<=1
    jle .not_prime
    cmpq $2, %rbx          # N==2
    je .prime
    #now we iterate as follows for(i=2;i<N;i++)if(N%i==0) goto .not_prime; goto .prime
    movq $2,%rsi           # %rsi now contains i
.loop:
    movq %rbx,%rax
    movq $0,%rdx
    div %rsi		   # %rdx now has the remainder
    cmpq $0,%rdx
    je .not_prime
    incq %rsi
    cmpq %rsi,%rbx
    je .prime
    jne .loop
.not_prime:
    movq $0, %rax          
    ret 
.prime:
    movq $1, %rax          
    ret

