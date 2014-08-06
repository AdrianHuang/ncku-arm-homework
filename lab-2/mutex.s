	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
	ldr r4, [r0] 	

	cmp r4, locked
	beq lock_mutex

	mov r4, locked

	str r4, [r0]

	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	ldr r4, [r0]

	cmp r4, locked
	moveq r4, unlocked

	str r4, [r0]
        
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
