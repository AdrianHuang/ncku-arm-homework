	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
	mov r1, locked

.loop:
	ldrex r4, [r0] 	

	cmp r4, unlocked
	strexeq r4, r1, [r0]
	cmp r4, #0
	bne .loop

	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	mov r4, unlocked

	@ memory barrier
	dmb
	str r4, [r0]
        
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
