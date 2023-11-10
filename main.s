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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #3808
	ldr	r4, .L4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+8
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startScreenTiles
	.word	100679680
	.word	startScreenMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r3, #4864
	mov	r2, #2048
	ldr	r0, .L8+4
	ldr	r4, .L8+8
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	mov	r3, #16384
	strh	r0, [r1, #10]	@ movhi
	ldr	r2, .L8+12
	mov	r0, #3
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+20
	ldr	r1, .L8+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+32
	ldr	r1, .L8+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	5896
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	spaceBgPal
	.word	100696064
	.word	tilesetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	initGame
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #2592
	ldr	r4, .L12
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+8
	ldr	r1, .L12+12
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsScreenTiles
	.word	100679680
	.word	instructionsScreenMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"button pressed\000"
	.text
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToInstructions
	ldr	r0, .L23+8
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.word	.LC0
	.word	mgba_printf
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #3776
	ldr	r4, .L27
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L27+8
	mov	r0, #3
	ldr	r1, .L27+12
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L27+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	DMANow
	.word	spaceBgTiles
	.word	100679680
	.word	spaceBgMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.0, %function
instructions.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L31
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L32:
	.align	2
.L31:
	.word	buttons
	.size	instructions.part.0, .-instructions.part.0
	.set	pause.part.0,instructions.part.0
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L35
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions.part.0
.L36:
	.align	2
.L35:
	.word	oldButtons
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #3872
	ldr	r4, .L39
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L39+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L39+8
	ldr	r1, .L39+12
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L39+20
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L39+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	DMANow
	.word	pauseScreenTiles
	.word	100679680
	.word	pauseScreenMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L48+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L48+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToPause
.L49:
	.align	2
.L48:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L69
	ldr	fp, .L69+4
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L69+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r9, .L69+16
	ldr	r10, .L69+20
	ldr	r8, .L69+24
	ldr	r7, .L69+28
	ldr	r4, .L69+32
.L52:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L62
.L54:
	.word	.L59
	.word	.L58
	.word	.L57
	.word	.L56
	.word	.L55
	.word	.L56
.L56:
	tst	r0, #8
	beq	.L62
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L52
.L57:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L52
.L58:
	tst	r0, #8
	beq	.L62
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L52
.L59:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L52
.L55:
	tst	r0, #8
	beq	.L62
	tst	r3, #8
	beq	.L68
.L62:
	mov	r0, r3
	b	.L52
.L68:
	ldr	r3, .L69+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L52
.L70:
	.align	2
.L69:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions.part.0
	.word	game
	.word	pause.part.0
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	instructions
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #3856
	ldr	r4, .L74
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L74+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L74+8
	ldr	r1, .L74+12
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L74+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L74+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	DMANow
	.word	winScreenTiles
	.word	100679680
	.word	winScreenMap
	.word	hideSprites
	.word	shadowOAM
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L81
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L82:
	.align	2
.L81:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #3824
	ldr	r4, .L85
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L85+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L85+8
	ldr	r1, .L85+12
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L85+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L85+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	DMANow
	.word	loseScreenTiles
	.word	100679680
	.word	loseScreenMap
	.word	hideSprites
	.word	shadowOAM
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L92
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L93:
	.align	2
.L92:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
