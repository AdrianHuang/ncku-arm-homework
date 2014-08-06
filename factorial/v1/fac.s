	.text

	.global fac
	.type fac, function
fac:
	cmp r0, #1
	bxeq lr
	
	cmp r0, #0
	bxeq lr

	@ lr: return address, r0: n
	stmfd	sp!, {r0, lr}

	sub r0, r0, #1
	blx fac

	@ r1: n-1 stored in stack, r2: returned address
	ldmfd sp!, {r1, r2}
	mul r0, r0, r1 
	bx r2
	
	.size fac, .-fac
	.end
