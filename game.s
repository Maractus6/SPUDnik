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
	.file	"game.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L15
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L15+4
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L13
	ldr	r1, .L15+8
	ldr	r0, .L15+12
	ldr	r1, [r1]
	strh	r2, [r0, #10]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #20]
.L4:
	ldr	r3, .L15+16
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L14
	ldr	r1, .L15+8
	ldr	r0, .L15+12
	ldr	r1, [r1]
	strh	r2, [r0, #14]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L15
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L13:
	ldm	r3, {r0, r1}
	ldr	r3, .L15+20
	mov	lr, pc
	bx	r3
	b	.L4
.L14:
	ldm	r3, {r0, r1}
	ldr	r3, .L15+24
	mov	lr, pc
	bx	r3
	b	.L3
.L16:
	.align	2
.L15:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	initPotatoes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPotatoes, %function
initPotatoes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	mov	r1, #16
	mov	ip, #0
	mov	r0, #5
	ldr	r3, .L21
.L18:
	str	r2, [r3, #8]
	add	r2, r2, #1
	cmp	r2, #13
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #36]
	add	r3, r3, #40
	bne	.L18
	bx	lr
.L22:
	.align	2
.L21:
	.word	potatoArr
	.size	initPotatoes, .-initPotatoes
	.align	2
	.global	initPauseSpaceship
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPauseSpaceship, %function
initPauseSpaceship:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	r1, #4
	mov	r2, #4000
	ldr	r3, .L24
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	bx	lr
.L25:
	.align	2
.L24:
	.word	pauseSpaceship
	.size	initPauseSpaceship, .-initPauseSpaceship
	.align	2
	.global	initSpaceship
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSpaceship, %function
initSpaceship:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #110
	mov	lr, #200
	mov	r0, #30
	mov	r1, #34
	mov	r2, #29
	ldr	r3, .L28
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	spaceship
	.size	initSpaceship, .-initSpaceship
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L34
	ldr	r3, .L34+4
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r1, #16
	mov	r0, #0
	mov	ip, #5
	ldr	r3, .L34+8
.L31:
	str	r2, [r3, #8]
	add	r2, r2, #1
	cmp	r2, #13
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #36]
	add	r3, r3, #40
	bne	.L31
	mov	r8, #200
	mov	r7, #110
	mov	r6, #30
	mov	r5, #34
	mov	r4, #29
	mov	r1, #15
	mov	ip, #2
	mov	r2, #8
	mov	lr, #300
	ldr	r3, .L34+12
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	ldr	r3, .L34+16
	str	r1, [r3]
	ldr	r3, .L34+20
	ldr	r1, .L34+24
	str	ip, [r3]
	ldr	r3, .L34+28
	str	r2, [r1]
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	ip, .L34+32
	ldr	r1, .L34+36
	ldr	r2, .L34+40
	ldr	r3, .L34+44
	str	lr, [ip]
	str	r0, [r1]
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	initPlayer
	.word	potatoArr
	.word	spaceship
	.word	numPotatoes
	.word	potatoYield
	.word	currLives
	.word	.LANCHOR0
	.word	timeUntilNextCycle
	.word	totalCycles
	.word	spaceshipColl
	.word	.LANCHOR1
	.size	initGame, .-initGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"cheat toggled\000"
	.text
	.align	2
	.global	toggleCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	toggleCheat, %function
toggleCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L42
	ldr	r3, [r4]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r0, .L42+4
	ldr	r2, .L42+8
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L37
	mov	r0, #150
	mov	r1, #30
	ldr	r3, .L42+12
	ldr	r2, .L42+16
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	add	r1, r2, #480
.L38:
	ldr	r3, [r2, #28]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	str	r3, [r2, #28]
	add	r2, r2, #40
	cmp	r2, r1
	bne	.L38
	pop	{r4, lr}
	bx	lr
.L37:
	mov	r2, #300
	ldr	r3, .L42+12
	pop	{r4, lr}
	str	r2, [r3, #8]
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR1
	.word	.LC0
	.word	mgba_printf
	.word	.LANCHOR0
	.word	potatoArr
	.size	toggleCheat, .-toggleCheat
	.align	2
	.global	tillField
	.syntax unified
	.arm
	.fpu softvfp
	.type	tillField, %function
tillField:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldm	r0, {r2, ip}
	cmp	ip, #0
	add	r1, r2, #7
	add	r3, ip, #7
	movge	r3, ip
	cmp	r2, #0
	movlt	r2, r1
	asr	r3, r3, #3
	add	r3, r3, #1
	asr	r2, r2, #3
	add	r1, r2, r3, lsl #5
	lsl	r1, r1, #1
	add	r0, r1, #100663296
	add	r0, r0, #49152
	ldrh	r1, [r0]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L57
	bic	r1, r1, #33
	cmp	r1, lr
	bne	.L56
.L44:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L56:
	lsl	r3, r3, #5
	add	r5, r2, #1
	add	r1, r3, r5
	lsl	r1, r1, #1
	add	r1, r1, #100663296
	add	r1, r1, #49152
	ldrh	r6, [r1]
	sub	r4, r6, #4096
	sub	r4, r4, #48
	cmp	r6, lr
	cmpne	r4, #1
	bls	.L44
	add	r3, r3, #32
	add	r2, r2, r3
	lsl	r2, r2, #1
	add	r2, r2, #100663296
	add	r2, r2, #49152
	ldrh	r7, [r2]
	ldr	r6, .L57+4
	sub	r4, r7, #4096
	sub	r4, r4, #16
	cmp	r7, r6
	cmpne	r4, #1
	bls	.L44
	add	r3, r5, r3
	lsl	r4, r3, #1
	add	r4, r4, #100663296
	add	r4, r4, #49152
	ldrh	r5, [r4]
	ldr	r7, .L57+8
	cmp	r5, r7
	cmpne	ip, #256
	movgt	r3, #1
	movle	r3, #0
	sub	ip, r5, #4096
	sub	ip, ip, #16
	cmp	ip, #1
	movls	r3, #0
	andhi	r3, r3, #1
	cmp	r3, #0
	beq	.L44
	ldr	ip, .L57+12
	ldr	r3, .L57+16
	strh	lr, [r0]	@ movhi
	strh	ip, [r1]	@ movhi
	ldr	r0, .L57+20
	strh	r7, [r2]	@ movhi
	ldr	r1, [r3]
	mov	r2, #0
	strh	r6, [r4]	@ movhi
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	b	.L44
.L58:
	.align	2
.L57:
	.word	4112
	.word	4145
	.word	4144
	.word	4113
	.word	minecraftDirt_length
	.word	minecraftDirt_data
	.word	playSoundB
	.size	tillField, .-tillField
	.align	2
	.global	animateLowHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateLowHealth, %function
animateLowHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L62
	ldr	r3, [r2, #12]
	sub	r3, r3, #1
	cmp	r3, #9
	str	r3, [r2, #12]
	bgt	.L60
	mov	r0, #0
	cmp	r3, r0
	moveq	r3, #20
	ldr	r1, .L62+4
	strh	r0, [r1, #2]	@ movhi
	streq	r3, [r2, #12]
	bx	lr
.L60:
	ldr	r3, .L62+4
	ldr	r2, .L62+8
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	83886592
	.word	4314
	.size	animateLowHealth, .-animateLowHealth
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"%d\000"
	.text
	.align	2
	.global	seedPotato
	.syntax unified
	.arm
	.fpu softvfp
	.type	seedPotato, %function
seedPotato:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r3, .L73
	ldr	r0, .L73+4
	mov	r1, #16
	mov	lr, pc
	bx	r3
	ldr	ip, [r4, #4]
	cmp	ip, #0
	ldr	r0, [r4]
	add	r3, ip, #7
	movge	r3, ip
	cmp	r0, #0
	add	r2, r0, #7
	movge	r2, r0
	asr	r3, r3, #3
	add	r3, r3, #1
	lsl	r3, r3, #5
	add	r3, r3, r2, asr #3
	ldr	r2, .L73+8
	lsl	r3, r3, #1
	ldrh	r2, [r2, r3]
	ldr	r3, .L73+12
	cmp	r2, r3
	beq	.L72
.L64:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L72:
	ldr	lr, .L73+16
	mov	r3, #0
	mov	r2, lr
	b	.L69
.L66:
	add	r3, r3, #1
	cmp	r3, #12
	add	r2, r2, #40
	beq	.L64
.L69:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L66
	rsbs	r2, r0, #0
	ldr	r5, .L73+20
	and	r2, r2, #7
	and	r4, r0, #7
	rsbpl	r4, r2, #0
	rsbs	r7, ip, #0
	ldr	r2, [r5]
	and	r7, r7, #7
	and	r6, ip, #7
	rsbpl	r6, r7, #0
	subs	r2, r2, #1
	mov	r7, #1
	movmi	r2, r1
	sub	r0, r0, r4
	ldr	r4, .L73+24
	add	r3, r3, r3, lsl #2
	ldr	r4, [r4, #8]
	sub	ip, ip, r6
	str	r0, [lr, r3, lsl #3]
	add	ip, ip, #4
	add	lr, lr, r3, lsl #3
	str	r1, [lr, #24]
	str	r1, [lr, #32]
	str	r7, [lr, #20]
	str	ip, [lr, #4]
	str	r4, [lr, #28]
	str	r2, [r5]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	mgba_printf
	.word	.LC1
	.word	100712448
	.word	4112
	.word	potatoArr
	.word	numPotatoes
	.word	.LANCHOR0
	.size	seedPotato, .-seedPotato
	.align	2
	.global	waterPotato
	.syntax unified
	.arm
	.fpu softvfp
	.type	waterPotato, %function
waterPotato:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r4, .L87
	ldr	r7, .L87+4
	ldr	r8, .L87+8
	ldr	fp, .L87+12
	ldr	r10, .L87+16
	ldr	r9, .L87+20
	sub	sp, sp, #20
	add	r6, r4, #480
.L78:
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #12]
	ldr	r2, [r5, #16]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L76
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L76
	ldr	r3, [r8, #4]
	cmp	r3, #0
	ble	.L76
	ldr	r2, [r4, #24]
	cmp	r2, #0
	bne	.L76
	add	r1, r4, #32
	ldm	r1, {r1, r2}
	sub	r2, r2, #1
	cmp	r1, r2
	beq	.L76
	mov	r2, #0
	mov	ip, #1
	ldr	lr, [fp]
	cmp	lr, r2
	subeq	r3, r3, #1
	streq	r3, [r8, #4]
	mov	r0, r9
	ldr	r3, .L87+24
	ldr	r1, [r10]
	str	ip, [r4, #24]
	mov	lr, pc
	bx	r3
	mov	r3, #90
	ldr	r2, .L87+28
	str	r3, [r2]
.L76:
	add	r4, r4, #40
	cmp	r4, r6
	bne	.L78
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	potatoArr
	.word	collision
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	wateringPlant_length
	.word	wateringPlant_data
	.word	playSoundB
	.word	isWatering
	.size	waterPotato, .-waterPotato
	.align	2
	.global	pickPotato
	.syntax unified
	.arm
	.fpu softvfp
	.type	pickPotato, %function
pickPotato:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L100
	mov	r5, r0
	mov	r4, r8
	mov	fp, #0
	ldr	r7, .L100+4
	ldr	r9, .L100+8
	ldr	r10, .L100+12
	sub	sp, sp, #20
	add	r6, r8, #480
.L91:
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #12]
	ldr	r2, [r5, #16]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L90
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L90
	ldr	r3, [r8, #36]
	ldr	r2, [r4, #32]
	sub	r3, r3, #1
	cmp	r2, r3
	ldreq	r3, [r9]
	ldreq	r2, [r10]
	addeq	r3, r3, r2
	streq	fp, [r4, #20]
	streq	r3, [r9]
.L90:
	add	r4, r4, #40
	cmp	r4, r6
	bne	.L91
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	potatoArr
	.word	collision
	.word	numPotatoes
	.word	potatoYield
	.size	pickPotato, .-pickPotato
	.align	2
	.global	eatPotato
	.syntax unified
	.arm
	.fpu softvfp
	.type	eatPotato, %function
eatPotato:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L109
	ldr	r3, [r0]
	cmp	r3, #0
	bxle	lr
	push	{r4, lr}
	ldr	r1, .L109+4
	ldr	lr, .L109+8
	ldr	r1, [r1]
	ldr	r2, [lr]
	cmp	r2, r1
	blt	.L108
	pop	{r4, lr}
	bx	lr
.L108:
	ldr	r1, .L109+12
	sub	r3, r3, #1
	str	r3, [r0]
	add	ip, r2, #1
	ldr	r1, [r1]
	mov	r2, #0
	ldr	r0, .L109+16
	ldr	r3, .L109+20
	str	ip, [lr]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	numPotatoes
	.word	.LANCHOR0
	.word	currLives
	.word	minecraftEating_length
	.word	minecraftEating_data
	.word	playSoundB
	.size	eatPotato, .-eatPotato
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L117
	ldr	r3, [r2]
	ldr	r1, .L117+4
	sub	r3, r3, #1
	cmp	r3, #0
	str	lr, [sp, #-4]!
	str	r3, [r2]
	ldr	r3, [r1]
	bne	.L112
	mov	lr, #300
	ldr	ip, .L117+8
	ldr	r0, [ip]
	sub	r3, r3, #1
	add	r0, r0, #1
	str	r3, [r1]
	str	r0, [ip]
	str	lr, [r2]
.L112:
	cmp	r3, #3
	bgt	.L113
	ldr	r2, .L117+12
	ldr	r3, [r2, #12]
	sub	r3, r3, #1
	cmp	r3, #9
	str	r3, [r2, #12]
	ble	.L116
.L113:
	ldr	r3, .L117+16
	ldr	r2, .L117+20
	ldr	lr, [sp], #4
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L116:
	mov	r0, #0
	cmp	r3, r0
	moveq	r3, #20
	ldr	r1, .L117+16
	ldr	lr, [sp], #4
	strh	r0, [r1, #2]	@ movhi
	streq	r3, [r2, #12]
	bx	lr
.L118:
	.align	2
.L117:
	.word	timeUntilNextCycle
	.word	currLives
	.word	totalCycles
	.word	.LANCHOR0
	.word	83886592
	.word	4314
	.size	updateLives, .-updateLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L128
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, lr}
	ble	.L124
	mov	r2, #2
	mov	r5, #5
	mov	r4, #320
	ldr	r1, .L128+4
	ldr	lr, .L128+8
	add	ip, r1, r3, lsl #3
.L121:
	and	r0, r2, lr
	strh	r5, [r1, #120]	@ movhi
	strh	r4, [r1, #124]	@ movhi
	strh	r0, [r1, #122]	@ movhi
	add	r2, r2, #10
	add	r1, r1, #8
	lsl	r2, r2, #16
	cmp	r1, ip
	lsr	r2, r2, #16
	bne	.L121
	add	lr, r3, #15
.L120:
	ldr	r2, .L128+12
	ldr	r1, [r2]
	cmp	r1, r3
	ble	.L119
	mov	ip, #5
	mov	r0, #352
	add	r3, r3, r3, lsl #2
	add	r1, r1, r1, lsl #2
	ldr	r2, .L128+4
	lsl	r3, r3, #17
	lsl	r1, r1, #17
	add	r3, r3, #131072
	add	r1, r1, #131072
	ldr	r5, .L128+8
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	add	r2, r2, lr, lsl #3
.L123:
	add	r4, r3, #10
	and	lr, r3, r5
	lsl	r3, r4, #16
	lsr	r3, r3, #16
	cmp	r3, r1
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L123
.L119:
	pop	{r4, r5, lr}
	bx	lr
.L124:
	mov	lr, #15
	b	.L120
.L129:
	.align	2
.L128:
	.word	currLives
	.word	shadowOAM
	.word	511
	.word	.LANCHOR0
	.size	drawLives, .-drawLives
	.align	2
	.global	updateNumWater
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNumWater, %function
updateNumWater:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, r0
	mov	ip, #32
	push	{r4, r5, lr}
	ldr	r1, .L143
	ldr	r4, .L143+4
	ldr	r0, [r1, #4]
	ldr	r3, [r4, #16]
	ldr	r1, [r2, #4]
	sub	sp, sp, #20
	sub	r1, r1, r3
	rsb	r3, r3, #300
	ldr	lr, [r2]
	str	r3, [sp, #4]
	rsb	r3, r0, #100
	str	r3, [sp]
	ldr	r5, .L143+8
	ldr	r3, [r2, #12]
	sub	r0, lr, r0
	ldr	r2, [r2, #16]
	str	ip, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L130
	ldr	r3, .L143+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L130
	ldr	r3, .L143+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L130
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #24]
	add	r3, r1, r3
	cmp	r3, r2
	strlt	r3, [r4, #4]
	blt	.L130
	movgt	r3, #1
	movle	r3, #0
	cmp	r1, r2
	movge	r1, #0
	andlt	r1, r3, #1
	cmp	r1, #0
	strne	r2, [r4, #4]
.L130:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	collision
	.word	oldButtons
	.word	buttons
	.size	updateNumWater, .-updateNumWater
	.align	2
	.global	drawNumWater
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNumWater, %function
drawNumWater:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #5
	mov	r2, #268
	ldr	r3, .L154
	ldr	ip, [r3]
	ldr	r1, .L154+4
	ldr	r3, .L154+8
	cmp	ip, #0
	strh	r0, [r3, #184]	@ movhi
	strh	r1, [r3, #186]	@ movhi
	strh	r2, [r3, #188]	@ movhi
	beq	.L146
	mov	ip, #10
	mov	r0, #225
	mov	r1, #52
	mov	r2, #512
	strh	ip, [r3, #192]	@ movhi
	strh	r0, [r3, #194]	@ movhi
	strh	r1, [r3, #196]	@ movhi
	strh	r2, [r3, #200]	@ movhi
	bx	lr
.L146:
	ldr	r2, .L154+12
	ldr	r2, [r2, #4]
	cmp	r2, #9
	push	{r4, r5, lr}
	bgt	.L153
	mov	r1, #512
	strh	r1, [r3, #192]	@ movhi
	asr	r1, r2, #31
.L149:
	mov	lr, #10
	mov	ip, #230
	ldr	r0, .L154+16
	smull	r4, r0, r2, r0
	rsb	r1, r1, r0, asr #2
	add	r1, r1, r1, lsl #2
	sub	r2, r2, r1, lsl #1
	add	r2, r2, #42
	strh	lr, [r3, #200]	@ movhi
	strh	r2, [r3, #204]	@ movhi
	strh	ip, [r3, #202]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L153:
	ldr	r0, .L154+16
	smull	r1, r0, r2, r0
	mov	r4, #10
	mov	lr, #225
	ldr	ip, .L154+20
	asr	r1, r2, #31
	rsb	r0, r1, r0, asr #2
	umull	r5, ip, r0, ip
	lsr	ip, ip, #3
	add	ip, ip, ip, lsl #2
	sub	r0, r0, ip, lsl #1
	add	r0, r0, #42
	strh	r0, [r3, #196]	@ movhi
	strh	r4, [r3, #192]	@ movhi
	strh	lr, [r3, #194]	@ movhi
	b	.L149
.L155:
	.align	2
.L154:
	.word	.LANCHOR1
	.word	16594
	.word	shadowOAM
	.word	.LANCHOR0
	.word	1717986919
	.word	-858993459
	.size	drawNumWater, .-drawNumWater
	.align	2
	.global	drawNumPotatoes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNumPotatoes, %function
drawNumPotatoes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #5
	ldr	r3, .L160
	ldr	r3, [r3]
	ldr	r2, .L160+4
	ldr	r0, .L160+8
	ldr	r1, .L160+12
	cmp	r3, #9
	push	{r4, r5, lr}
	strh	ip, [r2, #96]	@ movhi
	strh	r0, [r2, #98]	@ movhi
	strh	r1, [r2, #100]	@ movhi
	ble	.L157
	ldr	r0, .L160+16
	smull	r1, r0, r3, r0
	mov	r4, #10
	mov	lr, #195
	ldr	ip, .L160+20
	asr	r1, r3, #31
	rsb	r0, r1, r0, asr #2
	umull	r5, ip, r0, ip
	lsr	ip, ip, #3
	add	ip, ip, ip, lsl #2
	sub	r0, r0, ip, lsl #1
	add	r0, r0, #42
	strh	r0, [r2, #108]	@ movhi
	strh	r4, [r2, #104]	@ movhi
	strh	lr, [r2, #106]	@ movhi
.L158:
	mov	lr, #10
	mov	ip, #200
	ldr	r0, .L160+16
	smull	r4, r0, r3, r0
	rsb	r1, r1, r0, asr #2
	add	r1, r1, r1, lsl #2
	sub	r3, r3, r1, lsl #1
	add	r3, r3, #42
	strh	lr, [r2, #112]	@ movhi
	strh	r3, [r2, #116]	@ movhi
	strh	ip, [r2, #114]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L157:
	mov	r1, #512
	strh	r1, [r2, #104]	@ movhi
	asr	r1, r3, #31
	b	.L158
.L161:
	.align	2
.L160:
	.word	numPotatoes
	.word	shadowOAM
	.word	16564
	.word	8458
	.word	1717986919
	.word	-858993459
	.size	drawNumPotatoes, .-drawNumPotatoes
	.align	2
	.global	updatePotato
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePotato, %function
updatePotato:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L174
	ldr	r3, .L174+4
	str	lr, [sp, #-4]!
	ldr	lr, [r2, #8]
	add	ip, r3, #480
.L165:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3, #28]
	beq	.L163
	ldr	r1, [r3, #24]
	cmp	r1, #0
	subne	r2, r2, #1
	strne	r2, [r3, #28]
.L163:
	cmp	r2, #0
	bne	.L164
	add	r0, r3, #32
	ldm	r0, {r0, r1}
	sub	r1, r1, #1
	cmp	r0, r1
	addne	r0, r0, #1
	strne	r0, [r3, #32]
	strne	r2, [r3, #24]
	strne	lr, [r3, #28]
.L164:
	add	r3, r3, #40
	cmp	r3, ip
	bne	.L165
	ldr	lr, [sp], #4
	bx	lr
.L175:
	.align	2
.L174:
	.word	.LANCHOR0
	.word	potatoArr
	.size	updatePotato, .-updatePotato
	.align	2
	.global	drawPotato
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPotato, %function
drawPotato:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #512
	ldr	r1, .L182
	ldr	r2, .L182+4
	ldr	r3, .L182+8
	ldrh	r6, [r1, #16]
	ldrh	r5, [r2, #4]
	ldr	r0, .L182+12
	ldr	r4, .L182+16
	ldr	lr, .L182+20
	add	ip, r3, #480
.L179:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3, #8]
	add	r8, r0, r2, lsl #3
	lsl	r9, r2, #3
	lsleq	r2, r2, #3
	strheq	r7, [r0, r2]	@ movhi
	beq	.L178
	ldr	r10, [r3]
	ldr	r1, [r3, #32]
	ldr	r2, [r3, #4]
	sub	r10, r10, r5
	add	r1, r1, #128
	and	r10, r10, r4
	and	r1, lr, r1, lsl #1
	sub	r2, r2, r6
	orr	r10, r10, #16384
	orr	r1, r1, #8192
	and	r2, r2, #255
	strh	r10, [r8, #2]	@ movhi
	strh	r1, [r8, #4]	@ movhi
	strh	r2, [r0, r9]	@ movhi
.L178:
	add	r3, r3, #40
	cmp	r3, ip
	bne	.L179
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L183:
	.align	2
.L182:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	potatoArr
	.word	shadowOAM
	.word	511
	.word	1022
	.size	drawPotato, .-drawPotato
	.align	2
	.global	drawWaterMachine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWaterMachine, %function
drawWaterMachine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L185
	ldr	r3, [r3, #4]
	rsb	r3, r3, #100
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r2, .L185+4
	ldr	r2, [r2, #16]
	ldr	r1, .L185+8
	ldr	r0, .L185+12
	rsb	r2, r2, #300
	and	r2, r2, #255
	strh	r3, [r1, #178]	@ movhi
	strh	r2, [r1, #176]	@ movhi
	strh	r0, [r1, #180]	@ movhi
	bx	lr
.L186:
	.align	2
.L185:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	shadowOAM
	.word	16708
	.size	drawWaterMachine, .-drawWaterMachine
	.align	2
	.global	drawSpaceship
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSpaceship, %function
drawSpaceship:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L189
	ldr	r2, .L189+4
	ldr	r0, .L189+8
	ldr	ip, [r2, #4]
	ldr	r3, [r1]
	ldr	r2, [r1, #4]
	ldr	r0, [r0, #16]
	sub	r3, r3, ip
	sub	r2, r2, r0
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	and	r2, r2, #255
	mvn	r3, r3, lsl #18
	mvn	r2, r2, lsl #17
	mvn	r3, r3, lsr #18
	mvn	r2, r2, lsr #17
	ldr	r1, [r1, #8]
	ldr	ip, .L189+12
	str	lr, [sp, #-4]!
	ldr	lr, .L189+16
	add	r0, ip, r1, lsl #3
	lsl	r1, r1, #3
	strh	lr, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [ip, r1]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L190:
	.align	2
.L189:
	.word	spaceship
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	shadowOAM
	.word	12366
	.size	drawSpaceship, .-drawSpaceship
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L194
	ldr	r0, .L194+4
	mov	lr, pc
	bx	r3
	bl	updateLives
	bl	updatePotato
	ldr	r0, .L194+4
	bl	updateNumWater
	ldr	r0, .L194+8
	ldr	r1, .L194+12
	ldr	r2, [r0]
	ldr	r3, [r1, #8]
	cmp	r2, #0
	add	r3, r3, #1
	subgt	r2, r2, #1
	str	r3, [r1, #8]
	strgt	r2, [r0]
	pop	{r4, lr}
	bx	lr
.L195:
	.align	2
.L194:
	.word	updatePlayer
	.word	player
	.word	isWatering
	.word	.LANCHOR1
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r0, .L198
	ldr	r3, .L198+4
	mov	lr, pc
	bx	r3
	bl	drawPotato
	bl	drawNumPotatoes
	bl	drawNumWater
	bl	drawLives
	ldr	ip, .L198+8
	ldr	r3, .L198+12
	ldrh	r0, [r3, #16]
	ldr	r3, [ip, #4]
	sub	r3, r3, r0
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L198+16
	ldr	r1, [ip]
	ldrh	r2, [r2, #4]
	ldr	r4, .L198+20
	ldr	lr, [ip, #8]
	sub	r1, r1, r2
	rsb	r2, r2, #100
	ldr	ip, .L198+24
	and	r1, r1, r4
	and	r2, r2, r4
	ldr	r4, .L198+28
	lsl	r5, lr, #3
	strh	r3, [ip, r5]	@ movhi
	orr	r1, r1, r4
	orr	r2, r2, r4
	ldr	r3, .L198+32
	ldr	r4, .L198+36
	rsb	r0, r0, #300
	add	lr, ip, lr, lsl #3
	and	r0, r0, #255
	strh	r1, [lr, #2]	@ movhi
	strh	r4, [lr, #4]	@ movhi
	strh	r0, [ip, #176]	@ movhi
	strh	r2, [ip, #178]	@ movhi
	strh	r3, [ip, #180]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	player
	.word	drawPlayer
	.word	spaceship
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	511
	.word	shadowOAM
	.word	-16384
	.word	16708
	.word	12366
	.size	drawGame, .-drawGame
	.align	2
	.global	updatePauseSpaceship
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePauseSpaceship, %function
updatePauseSpaceship:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L204
	ldr	r3, [r2, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2, #16]
	bxne	lr
	ldr	r1, [r2, #8]
	ldr	r0, [r2, #12]
	add	r1, r1, #1
	cmp	r1, r0
	movge	r1, r3
	mov	r3, #4000
	str	r1, [r2, #8]
	str	r3, [r2, #16]
	bx	lr
.L205:
	.align	2
.L204:
	.word	pauseSpaceship
	.size	updatePauseSpaceship, .-updatePauseSpaceship
	.align	2
	.global	drawPauseSpaceship
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPauseSpaceship, %function
drawPauseSpaceship:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #70
	ldr	r3, .L211
	ldr	r1, .L211+4
	ldr	r2, [r3]
	ldr	r3, .L211+8
	add	r2, r2, r2, lsl #2
	ldr	r1, [r1, #8]
	and	r3, r3, r2, lsl #1
	ldr	r2, .L211+12
	orr	r3, r3, #16384
	cmp	r1, #1
	strh	r3, [r2, #162]	@ movhi
	strh	r0, [r2, #160]	@ movhi
	beq	.L210
	cmp	r1, #3
	ldreq	r3, .L211+16
	ldrne	r3, .L211+20
	strh	r3, [r2, #164]	@ movhi
	bx	lr
.L210:
	ldr	r3, .L211+24
	strh	r3, [r2, #164]	@ movhi
	bx	lr
.L212:
	.align	2
.L211:
	.word	totalCycles
	.word	pauseSpaceship
	.word	510
	.word	shadowOAM
	.word	5569
	.word	5441
	.word	5505
	.size	drawPauseSpaceship, .-drawPauseSpaceship
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L215
	ldr	r2, .L215+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L215+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L216:
	.align	2
.L215:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	isWatering,4,4
	.global	lowHealthAnimationCount
	.global	plantCycle
	.global	cheat
	.global	maxWater
	.global	waterAdded
	.global	spaceHoff
	.global	voff
	.global	hoff
	.global	amtWater
	.comm	timeUntilNextCycle,4,4
	.comm	totalCycles,4,4
	.comm	currLives,4,4
	.comm	spaceshipColl,4,4
	.global	maxLives
	.comm	potatoYield,4,4
	.comm	numPotatoes,4,4
	.comm	pauseSpaceship,20,4
	.comm	spaceship,20,4
	.comm	livesArr,96,4
	.comm	potatoArr,480,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	lives,4,4
	.comm	shadowOAM,1024,4
	.comm	player,40,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	maxLives, %object
	.size	maxLives, 4
maxLives:
	.word	8
	.type	amtWater, %object
	.size	amtWater, 4
amtWater:
	.word	10
	.type	plantCycle, %object
	.size	plantCycle, 4
plantCycle:
	.word	300
	.type	lowHealthAnimationCount, %object
	.size	lowHealthAnimationCount, 4
lowHealthAnimationCount:
	.word	10
	.type	voff, %object
	.size	voff, 4
voff:
	.word	256
	.type	waterAdded, %object
	.size	waterAdded, 4
waterAdded:
	.word	8
	.type	maxWater, %object
	.size	maxWater, 4
maxWater:
	.word	30
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	cheat, %object
	.size	cheat, 4
cheat:
	.space	4
	.type	hoff, %object
	.size	hoff, 4
hoff:
	.space	4
	.type	spaceHoff, %object
	.size	spaceHoff, 4
spaceHoff:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
