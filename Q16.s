/* Global data section starts */
.data

N:
    .long  6              # sizeof the array

sum: 
    .long                 # Sum of all the elements

array:
    .long 1,4,2,3,5,40    # the array elements

max:                      # Maximum of all array elements
    .long


/* Code section starts */

.text

.global main

main:
    mov array@GOTPCREL(%rip), %rcx # &array[0]: %rcx
    mov (%rcx), %eax               # sum: %eax
    movzbl (%rcx), %ebx            # maximum: %ebx
    mov N@GOTPCREL(%rip), %rdx     # get the value of N in %edx   
    movzbl (%rdx), %edx            # N: %edx
    mov $1, %r9d                   # %r9d = 1 
    cmp %edx,%r9d                  # 1 __ N
    je  .done    
.loop:
    dec %edx
    movzbl (%rcx, %rdx, 4), %r10   # temp = array[i]
    add %r10d, %eax                # sum += temp
    cmp %r10d, %ebx                # max __ temp
    jge .skip
    mov %r10d, %ebx                # max = temp if max < temp
.skip:
    cmp %edx, %r9d                 # 1 __ N
    jne  .loop   
.done:
    mov sum@GOTPCREL(%rip), %rcx   # Store %eax back to address of sum
    mov %eax, (%rcx)                
    mov max@GOTPCREL(%rip), %rcx   # Store %eax back to address of max
    mov %ebx,(%rcx)
    ret
