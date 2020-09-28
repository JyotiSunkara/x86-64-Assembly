/* Global data section starts */
.data

    N:
        .byte  10

    fibb:              # the result
        .long          # 4 bytes

/* Code section starts */

.text

.global main
main:
    mov N@GOTPCREL(%rip),%rax              # store N in register %rdi        
    mov (%rax),%rdi
    call fib                               # Calling fibonacci function
    mov fibb@GOTPCREL(%rip), %rbx          # transfer rax back into the main memory
    mov %rax, (%rbx)
    ret
    