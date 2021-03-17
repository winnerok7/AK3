.global lab1
.syntax unified

#define A #7
#define B #5
#define C #5

lab1:
	push {lr}
	mov r0, A
	and r0, B
	lsr r0, r0, #1
	mov r1, #1
	mov r2, C
	
	.fact:
		mul r1, r2
		subs r2, #1
		bne .fact
	add r0, r1
    mov r1, #0
	pop {pc}
