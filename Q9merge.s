.text

.global merge

merge: # rdi contains starting address of first array; rsi contains starting address of second array; rdx contains size of first array rcx co     contains the size of second array r8 contains address of merge array

    movq $0,%rax #pointer for first array
    movq $0,%rbx #pointer for second array
    movq $0,%r9  #pointer for merged array
    movq $1,%r14

.loop:
    movq (%rdi,%rax,8),%r12
    movq (%rsi,%rbx,8),%r13
    cmpq %r12,%r13    
    jge .first
    jl  .second
     .back:
    movq $0,%r10
    movq $0,%r11 
    cmpq %rax,%rdx
    cmovg %r14,%r10
    cmpq %rbx,%rcx
    cmovg %r14,%r11
    andq %r10,%r11
    cmpq $1,%r11
    je .loop
    jne .check1

.first:
   inc %rax
   movq %r12,(%r8,%r9,8)
   inc %r9  
   jmp .back

.second:
  inc %rbx
  movq %r13,(%r8,%r9,8)
  inc %r9
  jmp .back

.check1:  
   cmpq %rax,%rdx
   jg .loop1
   jle .check2

.loop1:
   movq (%rdi,%rax,8),%r12
   inc %rax
   movq %r12,(%r8,%r9,8)
   inc %r9
   cmpq %rax,%rdx
   jg .loop1
   je .check2

.check2:
  cmpq %rbx,%rcx
  jg .loop2   

.loop2: #left over elements in array2
   movq (%rsi,%rbx,8),%r13
   movq %r13,(%r8,%r9,8)
   inc %rbx
   inc %r9
   cmpq %rbx,%rcx
   jg .loop2


