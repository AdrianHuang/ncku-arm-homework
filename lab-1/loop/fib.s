	.text

	.global	fibonacci
	.type fibonacci, function
fibonacci:
	cmp r0, #1
	bxeq lr

	cmp r0, #0
	bxeq lr

	@ Result. Note this result can be used as F(n-1) for 
	@ the next iteration.
	mov r2, #1 

	@ Previous result: F(n-2)
	mov r3, #0 

loop:
	mov r4, r2
	add r2, r2, r3
	mov r3, r4

	sub r0, r0, #1
	cmp r0, #2
	bge loop

	@ Update and return the result
	mov r0, r2 
	bx lr

	.size fibonacci, .-fibonacci	
