	.text

	.global fac
	.type fac, function
fac:
	stmfd sp!, {r4, lr}

	cmp r0, #1
	bleq return1
	
	mov r4, r0
	sub r0, r0, #1
	blx fac
	
	mul r0, r4 
	ldmfd sp!, {r4, pc}

return1:
	ldmfd sp!, {r4, pc}
	
	.size fac, .-fac
	.end
