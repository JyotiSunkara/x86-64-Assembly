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
    mov   N@GOTPCREL(%rip), %rbx          # store N in register %ebx        
    movzbl  (%rbx), %ebx    
    cmpl $0, %ebx          # N == 0 
    jne .not_zero
    movl $0, %eax          # return 0
    jmp .done
.not_zero:
    cmpl $1, %ebx          # N == 1
    jne .not_one
    movl $1, %eax          # return 1
    jmp .done
.not_one:
    movl $0, %edx          # f1 = 0
    movl $1, %r8d          # f2 = 1
    movl $1, %ecx          # now = 0
.lback:
    cmpl %ecx, %ebx        # now == N
    je .done
    movl $0, %r9d          # f3 = 0
    addl %r8d, %r9d        # f3 += f2
    addl %edx, %r9d        # f3 += f1
    movl %r8d, %edx        # f1 = f2
    movl %r9d, %r8d        # f2 = f3
    incl %ecx              # now ++
    jmp .lback
    movl %r8d, %eax        # fibb = f2
.done:
    mov fibb@GOTPCREL(%rip), %rbx          # transfer rax back into the main memory
    mov %eax, (%rbx)
    ret
