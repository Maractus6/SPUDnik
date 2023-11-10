	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"player.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"WE did it patrick we initialized the player!\000"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #16
	mov	lr, #117
	mov	r3, #0
	mov	r6, #50
	mov	r5, #100
	mov	r4, #1
	mov	ip, #10
	mov	r1, #4
	str	r6, [r0]
	str	r5, [r0, #4]
	str	r4, [r0, #8]
	strb	lr, [r0, #36]
	str	r3, [r0, #20]
	str	r3, [r0, #28]
	str	ip, [r0, #24]
	str	r1, [r0, #32]
	str	r2, [r0, #12]
	str	r2, [r0, #16]
	ldr	r3, .L4
	ldr	r0, .L4+4
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_printf
	.word	.LC0
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	r1, [r0, #20]
	lsl	r3, r3, #23
	ldr	r2, .L21
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	cmp	r1, #0
	strh	r3, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	ldrb	r3, [r0, #36]	@ zero_extendqisi2
	bne	.L7
	cmp	r3, #117
	beq	.L16
	cmp	r3, #108
	beq	.L17
	cmp	r3, #114
	beq	.L18
.L15:
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L7:
	cmp	r3, #108
	ldr	r1, [r0, #28]
	beq	.L19
	cmp	r3, #114
	beq	.L20
	cmp	r3, #117
	ldr	r3, .L21+4
	andne	r1, r3, r1, lsl #1
	bne	.L15
	add	r1, r1, #96
	and	r1, r3, r1, lsl #1
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L16:
	mov	r3, #192
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L18:
	mov	r3, #64
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L19:
	ldr	r3, .L21+4
	add	r1, r1, #64
	and	r1, r3, r1, lsl #1
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L17:
	mov	r3, #128
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L20:
	add	r3, r3, #908
	add	r1, r1, #32
	and	r1, r3, r1, lsl #1
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L22:
	.align	2
.L21:
	.word	shadowOAM
	.word	1022
	.size	drawPlayer, .-drawPlayer
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"headed right\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L49
	ldrh	r3, [r5]
	tst	r3, #32
	mov	r4, r0
	str	r2, [r0, #20]
	bne	.L25
	mov	r1, #1
	ldr	r2, [r0]
	ldr	r0, [r0, #8]
	sub	r2, r2, r0
	cmp	r2, #0
	str	r1, [r4, #20]
	movgt	r1, #108
	strgt	r2, [r4]
	strbgt	r1, [r4, #36]
.L25:
	tst	r3, #16
	bne	.L27
	mov	r1, #1
	ldr	r2, [r4]
	ldr	r0, [r4, #8]
	add	r2, r2, r0
	cmp	r2, #239
	str	r1, [r4, #20]
	ble	.L46
.L27:
	tst	r3, #64
	bne	.L29
	mov	r0, #1
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #8]
	add	ip, r2, r1
	cmp	ip, #0
	str	r0, [r4, #20]
	movgt	r0, #117
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	strbgt	r0, [r4, #36]
.L29:
	tst	r3, #128
	bne	.L32
	mov	r0, #1
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #8]
	sub	ip, r2, r1
	cmp	ip, #159
	str	r0, [r4, #20]
	movle	r0, #100
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	strble	r0, [r4, #36]
.L32:
	ldr	r6, .L49+4
	ldrh	r2, [r6]
	tst	r2, #256
	beq	.L34
	tst	r3, #256
	beq	.L47
.L34:
	tst	r2, #1
	beq	.L35
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L48
.L35:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L36
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L23
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #32]
	add	r2, r2, #1
	cmp	r2, r1
	movge	r2, r3
	mov	r3, #10
	str	r2, [r4, #28]
	str	r3, [r4, #24]
.L23:
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	mov	r2, #1
	mov	r3, #10
	str	r2, [r4, #28]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	mov	r0, r4
	ldr	r3, .L49+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L49+12
	mov	lr, pc
	bx	r3
	b	.L35
.L46:
	mov	r3, #114
	str	r2, [r4]
	strb	r3, [r4, #36]
	ldr	r0, .L49+16
	ldr	r3, .L49+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L27
.L47:
	mov	r0, r4
	ldr	r3, .L49+24
	mov	lr, pc
	bx	r3
	ldrh	r2, [r6]
	b	.L34
.L50:
	.align	2
.L49:
	.word	buttons
	.word	oldButtons
	.word	waterPotato
	.word	pickPotato
	.word	.LC1
	.word	mgba_printf
	.word	seedPotato
	.size	updatePlayer, .-updatePlayer
	.comm	lives,4,4
	.comm	shadowOAM,1024,4
	.comm	player,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
