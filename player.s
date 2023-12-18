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
	push	{r4, r5, lr}
	mov	r3, #16
	mov	r5, #272
	mov	r4, #1
	mov	lr, #117
	mov	r2, #0
	mov	ip, #10
	mov	r1, #4
	str	r5, [r0, #4]
	str	r4, [r0, #8]
	strb	lr, [r0, #36]
	str	ip, [r0, #24]
	str	r1, [r0, #32]
	str	r3, [r0]
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	str	r2, [r0, #20]
	str	r2, [r0, #28]
	pop	{r4, r5, lr}
	bx	lr
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
	ldr	r2, .L25
	ldr	r3, [r0]
	ldr	r2, [r2]
	ldr	r1, .L25+4
	str	lr, [sp, #-4]!
	sub	r3, r3, r2
	ldr	lr, [r1]
	ldr	r2, [r0, #4]
	ldr	ip, [r0, #20]
	lsl	r3, r3, #23
	ldr	r1, .L25+8
	lsr	r3, r3, #23
	sub	r2, r2, lr
	orr	r3, r3, #16384
	and	r2, r2, #255
	cmp	ip, #0
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	ldrb	r3, [r0, #36]	@ zero_extendqisi2
	bne	.L5
	ldr	r2, .L25+12
	cmp	r3, #117
	ldr	r2, [r2]
	beq	.L20
	cmp	r3, #108
	beq	.L21
	cmp	r3, #114
	beq	.L22
	cmp	r2, #0
	movne	r3, #74
	strhne	r3, [r1, #4]	@ movhi
	bne	.L4
.L19:
	strh	r2, [r1, #4]	@ movhi
.L4:
	ldr	lr, [sp], #4
	bx	lr
.L5:
	cmp	r3, #108
	ldr	r2, [r0, #28]
	beq	.L23
	cmp	r3, #114
	beq	.L24
	cmp	r3, #117
	ldr	r3, .L25+16
	addeq	r2, r2, #96
	andeq	r2, r3, r2, lsl #1
	strheq	r2, [r1, #4]	@ movhi
	beq	.L4
	and	r2, r3, r2, lsl #1
	b	.L19
.L20:
	cmp	r2, #0
	moveq	r3, #192
	movne	r3, #200
	ldr	lr, [sp], #4
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L22:
	cmp	r2, #0
	moveq	r3, #64
	movne	r3, #72
	strh	r3, [r1, #4]	@ movhi
	b	.L4
.L23:
	ldr	r3, .L25+16
	add	r2, r2, #64
	and	r2, r3, r2, lsl #1
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L21:
	cmp	r2, #0
	moveq	r3, #128
	movne	r3, #136
	ldr	lr, [sp], #4
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L24:
	add	r3, r3, #908
	add	r2, r2, #32
	and	r2, r3, r2, lsl #1
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L26:
	.align	2
.L25:
	.word	hoff
	.word	voff
	.word	shadowOAM
	.word	isWatering
	.word	1022
	.size	drawPlayer, .-drawPlayer
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
	mov	r3, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L78
	ldrh	r2, [r5]
	tst	r2, #32
	mov	r4, r0
	str	r3, [r0, #20]
	bne	.L29
	mov	r1, #1
	ldr	r3, [r0]
	ldr	r0, [r0, #8]
	sub	r3, r3, r0
	cmp	r3, #0
	str	r1, [r4, #20]
	movgt	r1, #108
	strgt	r3, [r4]
	strbgt	r1, [r4, #36]
.L29:
	tst	r2, #16
	bne	.L32
	ldr	r3, [r4]
	ldr	r1, [r4, #8]
	add	r3, r3, r1
	ldr	r1, [r4, #16]
	rsb	r1, r1, #256
	cmp	r3, r1
	mov	r0, #1
	movlt	r1, #114
	str	r0, [r4, #20]
	strlt	r3, [r4]
	strblt	r1, [r4, #36]
.L32:
	tst	r2, #64
	bne	.L35
	mov	r0, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #8]
	add	ip, r3, r1
	cmp	ip, #256
	str	r0, [r4, #20]
	movgt	r0, #117
	subgt	r3, r3, r1
	strgt	r3, [r4, #4]
	strbgt	r0, [r4, #36]
.L35:
	tst	r2, #128
	bne	.L38
	add	r0, r4, #8
	ldm	r0, {r0, r3}
	ldr	r1, [r4, #4]
	rsb	r3, r3, #512
	sub	lr, r1, r0
	cmp	lr, r3
	mov	ip, #1
	movlt	r3, #100
	addlt	r1, r1, r0
	str	ip, [r4, #20]
	strlt	r1, [r4, #4]
	strblt	r3, [r4, #36]
.L38:
	ldr	r6, .L78+4
	ldrh	r3, [r6]
	tst	r3, #256
	beq	.L40
	tst	r2, #256
	beq	.L72
.L40:
	tst	r3, #512
	beq	.L41
	ldrh	r2, [r5]
	tst	r2, #512
	beq	.L73
.L41:
	tst	r3, #1
	beq	.L42
	ldrh	r2, [r5]
	tst	r2, #1
	beq	.L74
.L42:
	tst	r3, #2
	beq	.L43
	ldrh	r2, [r5]
	tst	r2, #2
	beq	.L75
.L43:
	tst	r3, #256
	beq	.L44
	tst	r3, #512
	bne	.L76
.L44:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L45
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	beq	.L77
.L46:
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	rsb	r2, r2, #160
	ldr	r1, [r4]
	add	r2, r2, r2, lsr #31
	rsb	r3, r3, #240
	sub	r2, r0, r2, asr #1
	add	r3, r3, r3, lsr #31
	ldr	r0, .L78+8
	sub	r3, r1, r3, asr #1
	cmp	r2, #352
	str	r3, [r0]
	ble	.L48
	mov	r1, #352
	ldr	r2, .L78+12
	str	r1, [r2]
.L49:
	cmp	r3, #16
	movgt	r3, #16
	strgt	r3, [r0]
	bgt	.L27
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r0]
.L27:
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	cmp	r2, #175
	movle	r1, #176
	ldrgt	r1, .L78+12
	ldrle	r2, .L78+12
	strgt	r2, [r1]
	strle	r1, [r2]
	b	.L49
.L45:
	mov	r2, #1
	mov	r3, #10
	str	r2, [r4, #28]
	str	r3, [r4, #24]
	b	.L46
.L77:
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #32]
	add	r2, r2, #1
	cmp	r2, r1
	movge	r2, r3
	mov	r3, #10
	str	r2, [r4, #28]
	str	r3, [r4, #24]
	b	.L46
.L76:
	ldrh	r3, [r5]
	tst	r3, #768
	bne	.L44
	mov	r0, r4
	ldr	r3, .L78+16
	mov	lr, pc
	bx	r3
	b	.L44
.L72:
	ldr	r3, .L78+20
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	b	.L40
.L73:
	ldr	r3, .L78+24
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	b	.L41
.L74:
	mov	r0, r4
	ldr	r3, .L78+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+32
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	b	.L42
.L75:
	ldr	r3, .L78+36
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	b	.L43
.L79:
	.align	2
.L78:
	.word	buttons
	.word	oldButtons
	.word	hoff
	.word	voff
	.word	toggleCheat
	.word	seedPotato
	.word	tillField
	.word	waterPotato
	.word	pickPotato
	.word	eatPotato
	.size	updatePlayer, .-updatePlayer
	.comm	lives,4,4
	.comm	shadowOAM,1024,4
	.comm	player,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
