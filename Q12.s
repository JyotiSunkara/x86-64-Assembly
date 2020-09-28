/* Global data section starts */

.data
    .align 8 

    N:
        .double  0

    fibb:          #the result
        .double          #4 bytes
    
    format:
        .asciz  "%5ld\n"

/* Code section starts */

.text

.global main
main:
    mov   N@GOTPCREL(%rip), %rbx          #store N in register %rbx        
    mov  (%rbx), %rbx    
    cmp $0, %rbx          #N==0 
    jne .not_zero
    mov $0, %rax          #return 0
    jmp .done
.not_zero:
    cmp $1, %rbx          #N==1
    jne .not_one
    mov $1, %rax          #return 1
    jmp .done
.not_one:
    mov $0, %rdx          #f1=0
    mov $1, %r8          #f2=1
    mov $1, %rcx          #now=0
.lback:
    cmp %rcx, %rbx          #N__now
    jle .done
    mov $0, %r9          #f3=0
    add %r8, %r9          #f3+=f2
    add %rdx, %r9          #f3+=f1
    mov %r8, %rdx          #f1=f2
    mov %r9, %r8          #f2=f3
    inc %rcx          #now++
    jmp .lback
    mov %r8, %rax          #fibb=f2
.done:
    mov fibb@GOTPCREL(%rip), %rbx          #transfer rax back into the main memory
    mov %rax, (%rbx)
    mov     $format, %rdi           # set 1st parameter (format)
    mov     %rax, %rsi              # set 2nd parameter (current_number)
    xor     %rax, %rax              # because printf is varargs
    call    printf                  # printf(format, current_number)

    ret
