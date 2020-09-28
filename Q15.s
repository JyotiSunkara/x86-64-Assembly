.data
N:
		.byte 10

.text	
.global main
main:
	movq N@GOTPCREL(%rip),%rcx 			# %rcx = N
	movq (%rcx),%rcx

.loop:
	cmpq $0,%rcx  
	je .move
	cmpq $1,%rcx
	je .move
	push %rcx
	dec %rcx
	callq .loop
	mov %rax,%rdx 
	push %rdx
	dec %rcx
	callq .loop
	pop %rdx
	addq %rax,%rdx 
	pop %rcx
	mov %rdx,%rax
	ret

.move:
	mov %rcx,%rax
	ret

.laba:
	mov $0,%rdx	
	call .loop

.exit:
	ret
