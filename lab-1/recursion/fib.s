	.text

	.global	fibonacci
	.type fibonacci, function
fibonacci:
	stmfd sp!, {r4, r5, lr}

	cmp r0, #0
	ble returnF0

	cmp r0, #1
	beq returnF1

	@ Store the value to r4 before substracting 1
	mov r4, r0

	@ Calcuate the value of f(n-1), and the value of f(n-1) is stored
	@ to r0
	sub r0, r4, #1
	blx fibonacci

	@ Store the value of f(n-1) to r5 while r4 holds the value of n
	mov r5, r0

	@ Calcuate the result of f(n-2)
	sub r0, r4, #2
	blx fibonacci

	@ Get the result of "f(n-1) + f(n-2)". 
	@ The register r0 represents f(n-2) while the register r5 represents
	@ f(n-1) 
	add r0, r5

	ldmfd sp!, {r4, r5, pc}

returnF0:
	mov r0, #0
	ldmfd sp!, {r4, r5, pc}

returnF1:
	mov r0, #1
	ldmfd sp!, {r4, r5, pc}
	
	.size fibonacci, .-fibonacci	
	.end
