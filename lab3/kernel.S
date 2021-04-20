.syntax unified
.cpu cortex-m4
.thumb
 
#define a #4
#define b #6
#define c #2
 
.global vtable_kernel
.global __kernel_reset__
 
.type vtable_kernel, %object
.type __kernel_reset__, %function
 
.section .interrupt_vector
vtable_kernel:
    .word __stack_start
    .word __kernel_reset__+1
    .size vtable_kernel, .-vtable_kernel
 
.section .rodata
    data:  .asciz "kernel started!\n"
    final: .asciz "Value in register #3: "
.section .text
__kernel_reset__:
    ldr r0, =data
    bl dbgput_line
 
    // calculate
	mov r0, a
	and r0, b
	lsr r0, r0, #1
	mov r1, #1
	mov r2, c
	.fact:
		mul r1, r2
		subs r2, #1
		bne .fact
	add r0, r1
    mov r1, #0
 
    ldr r0, =final
    bl dbgput
    mov r0, r3
    bl dbgput_num
 
    end:
    b end

