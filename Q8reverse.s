.text

.global reverse

reverse:  # rdi:string, i.e. the character array
   mov $0, %rbx               # %rbx : length of the string
   mov (%rdi),%r10b    # %r8b: a temporary variable to store s[len]
   cmp $0, %r10b
   je .out1
.loop1:
   incq %rbx
   mov (%rdi,%rbx,1),%r10b    # r10b: a temporary variable to store s[len]
   cmp $0, %r10b
   jne .loop1
.out1:
   decq %rbx                  # %rbx now contains the length : let it now contain the right pointing thing
   mov $0,%rcx                # %rcx is the front moving thing
   cmp %rbx,%rcx
   jge  .done
.loop2:
   mov (%rdi,%rcx,1),%r10b    # r10b: a temporary variable to store s[left]
   mov (%rdi,%rbx,1),%r11b    # r11b: a temporary variable to store s[right]
   mov %r11b,(%rdi,%rcx,1)    # store r11b in s[right]
   mov %r10b,(%rdi,%rbx,1)    # store r10b in s[left]  
   incq %rcx
   decq %rbx
   cmp %rbx,%rcx
   jl .loop2
.done:
   ret
 
  
