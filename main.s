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
	mov	r2, #100663296
	ldr	r4, .L4
	mov	r0, #3
	ldr	r3, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L4+20
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r4, #0
	mov	r3, #67108864
	ldr	r2, .L4+24
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	strh	r4, [r3, #20]	@ movhi
	strh	r4, [r3, #22]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+28
	ldr	ip, .L4+32
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L4+36
	ldr	r3, .L4+40
	str	r4, [ip]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	4528
	.word	startScreenTiles
	.word	100687872
	.word	startScreenMap
	.word	startScreenPal
	.word	initGame
	.word	startScreenMusic_length
	.word	state
	.word	startScreenMusic_data
	.word	playSoundA
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
	mov	r3, #67108864
	mov	r2, #4352
	ldr	r0, .L8+4
	ldr	r1, .L8+8
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r2, .L8+12
	strh	r1, [r3, #10]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+20
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+32
	ldr	r1, .L8+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+44
	ldr	r1, .L8+48
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+56
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	3073
	.word	-26616
	.word	setupInterrupts
	.word	setupSounds
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
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToStory
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStory, %function
goToStory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #8384
	ldr	r4, .L16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #1
	ldr	r1, .L16+20
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	str	r0, [r1]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	storyScreenTiles
	.word	100687872
	.word	storyScreenMap
	.word	storyScreenPal
	.word	state
	.size	goToStory, .-goToStory
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
	@ link register save eliminated.
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStory
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
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
	mov	r2, #100663296
	ldr	r4, .L27
	mov	r0, #3
	ldr	r3, .L27+4
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+12
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+20
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r0, #0
	mov	r3, #512
	strh	r0, [r1, #16]	@ movhi
	mov	r2, #117440512
	strh	r0, [r1, #18]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	strh	r0, [r1, #22]	@ movhi
	mov	r0, #3
	ldr	r1, .L27+28
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L27+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	DMANow
	.word	6304
	.word	instructionsScreenTiles
	.word	100687872
	.word	instructionsScreenMap
	.word	instructionsScreenPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	story
	.syntax unified
	.arm
	.fpu softvfp
	.type	story, %function
story:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.size	story, .-story
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
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r6, #67108864
	ldr	r5, .L42
	mov	r3, #3616
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	ldr	r1, .L42+4
	mov	r2, #100663296
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L42+8
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L42+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L42+20
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L41
.L37:
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L42+24
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldr	r1, .L42+28
	ldr	r3, .L42+32
	strh	r1, [r2, #8]	@ movhi
	ldr	r0, .L42+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r3, .L42+40
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L42+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L41:
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L42+48
	ldr	r1, .L42+52
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L42+56
	ldr	r1, .L42+60
	mov	lr, pc
	bx	r5
	mov	r3, #512
	ldr	r1, .L42+64
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L42+68
	ldr	r1, .L42+72
	strh	r3, [r6, #10]	@ movhi
.L38:
	lsl	r3, r4, #1
	add	r3, r3, #100663296
	add	r3, r3, #49152
	ldrh	r2, [r3]
	ldrh	r0, [r1, #2]!
	add	r4, r4, #1
	orr	r2, r2, r0
	orr	r2, r2, #4096
	cmp	r4, #2048
	strh	r2, [r3]	@ movhi
	bne	.L38
	b	.L37
.L43:
	.align	2
.L42:
	.word	DMANow
	.word	spaceBgLongTiles
	.word	100687872
	.word	spaceBgLongMap
	.word	tilesetPal
	.word	.LANCHOR0
	.word	spaceBgLongPal
	.word	19457
	.word	gameScreenMusic_length
	.word	gameScreenMusic_data
	.word	playSoundA
	.word	state
	.word	100712448
	.word	gameMapMap
	.word	100696064
	.word	tilesetTiles
	.word	shadowOAM
	.word	-26616
	.word	gameMapMap-2
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
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L47:
	.align	2
.L46:
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
	ldr	r3, .L50
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions.part.0
.L51:
	.align	2
.L50:
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
	mov	ip, #0
	mov	r0, #67108864
	mov	r3, #4352
	ldr	r2, .L54
	push	{r4, lr}
	ldr	r1, .L54+4
	strh	r3, [r0]	@ movhi
	ldr	r4, .L54+8
	strh	r2, [r0, #8]	@ movhi
	add	r3, r3, #672
	strh	ip, [r0, #16]	@ movhi
	mov	r2, #100663296
	strh	ip, [r0, #18]	@ movhi
	strh	ip, [r0, #20]	@ movhi
	strh	ip, [r0, #22]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L54+12
	ldr	r1, .L54+16
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L54+20
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+24
	mov	lr, pc
	bx	r3
	mov	ip, #70
	ldr	r3, .L54+28
	ldr	r2, [r3]
	ldr	r3, .L54+32
	add	r2, r2, r2, lsl #2
	ldr	r1, .L54+36
	ldr	r0, .L54+40
	and	r3, r3, r2, lsl #1
	orr	r3, r3, #16384
	strh	r3, [r1, #162]	@ movhi
	strh	ip, [r1, #160]	@ movhi
	strh	r0, [r1, #164]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	lr, #4
	ldr	r3, .L54+44
	ldr	ip, .L54+48
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L54+52
	ldr	r3, .L54+56
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L54+60
	ldr	r3, .L54+64
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	3073
	.word	pauseScreenTiles
	.word	DMANow
	.word	100687872
	.word	pauseScreenMap
	.word	pauseScreenPal
	.word	hideSprites
	.word	totalCycles
	.word	510
	.word	shadowOAM
	.word	5441
	.word	pauseScreenMusic_length
	.word	state
	.word	pauseScreenMusic_data
	.word	playSoundA
	.word	.LANCHOR0
	.word	initPauseSpaceship
	.size	goToPause, .-goToPause
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
	push	{r4, lr}
	ldr	r3, .L59
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L59+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L59+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+16
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	pause.part.0
.L56:
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	updatePauseSpaceship
	.word	drawPauseSpaceship
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
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
	push	{r4, r5, r6, lr}
	mov	r3, #4352
	mov	r6, #67108864
	mov	r4, #0
	ldr	r5, .L63
	strh	r3, [r6]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L63+4
	add	r3, r3, #16
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L63+8
	ldr	r1, .L63+12
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L63+16
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L63+20
	mov	lr, pc
	bx	r3
	strh	r4, [r6, #16]	@ movhi
	mov	r3, #512
	strh	r4, [r6, #20]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	strh	r4, [r6, #22]	@ movhi
	ldr	r1, .L63+24
	mov	lr, pc
	bx	r5
	mov	lr, #5
	ldr	r3, .L63+28
	ldr	ip, .L63+32
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L63+36
	ldr	r0, .L63+40
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+44
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	winScreenTiles
	.word	100687872
	.word	winScreenMap
	.word	winScreenPal
	.word	hideSprites
	.word	shadowOAM
	.word	pauseScreenMusic_length
	.word	state
	.word	playSoundA
	.word	pauseScreenMusic_data
	.word	.LANCHOR0
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
	ldr	r3, .L67
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L68:
	.align	2
.L67:
	.word	oldButtons
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
	push	{r4, r5, r6, lr}
	mov	r3, #4352
	mov	r6, #67108864
	mov	r4, #0
	ldr	r5, .L71
	strh	r3, [r6]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L71+4
	add	r3, r3, #304
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L71+8
	ldr	r1, .L71+12
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L71+16
	mov	r3, #256
	mov	lr, pc
	bx	r5
	ldr	r3, .L71+20
	mov	lr, pc
	bx	r3
	strh	r4, [r6, #16]	@ movhi
	mov	r3, #512
	strh	r4, [r6, #20]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	strh	r4, [r6, #22]	@ movhi
	ldr	r1, .L71+24
	mov	lr, pc
	bx	r5
	mov	lr, #6
	ldr	r3, .L71+28
	ldr	ip, .L71+32
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L71+36
	ldr	r0, .L71+40
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+44
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	DMANow
	.word	loseScreenTiles
	.word	100687872
	.word	loseScreenMap
	.word	loseScreenPal
	.word	hideSprites
	.word	shadowOAM
	.word	pauseScreenMusic_length
	.word	state
	.word	playSoundA
	.word	pauseScreenMusic_data
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
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
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+12
	ldr	r3, [r3]
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	mov	r2, #67108864
	ldr	r0, .L84+16
	asr	r3, r3, #3
	rsbs	r1, r3, #0
	and	r1, r1, r0
	and	r3, r3, r0
	rsbpl	r3, r1, #0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L84+20
	ldrh	r1, [r3]
	ldr	r3, .L84+24
	strh	r1, [r2, #20]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #22]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L84+28
	ldr	r4, .L84+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L81
	ldr	r3, .L84+40
	ldr	r3, [r3]
	cmp	r3, #20
	beq	.L82
.L75:
	ldr	r3, .L84+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L73
	ldr	r3, .L84+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
.L73:
	pop	{r4, lr}
	bx	lr
.L81:
	bl	goToLose
	ldr	r3, .L84+40
	ldr	r3, [r3]
	cmp	r3, #20
	bne	.L75
.L82:
	bl	goToWin
	b	.L75
.L83:
	pop	{r4, lr}
	b	goToPause
.L85:
	.align	2
.L84:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	spaceHoff
	.word	511
	.word	hoff
	.word	voff
	.word	shadowOAM
	.word	DMANow
	.word	currLives
	.word	totalCycles
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
	ldr	r4, .L108
	ldr	fp, .L108+4
	ldr	r3, .L108+8
	mov	lr, pc
	bx	r3
	ldr	r7, .L108+12
	ldr	lr, [r4]
	ldrh	ip, [fp]
	ldr	r9, .L108+16
	ldr	r6, .L108+20
	ldr	r5, .L108+24
	ldr	r8, .L108+28
	ldr	r10, .L108+32
.L88:
	strh	ip, [r7]	@ movhi
	ldrh	r3, [r10, #48]
	strh	r3, [fp]	@ movhi
	cmp	lr, #6
	ldrls	pc, [pc, lr, asl #2]
	b	.L98
.L90:
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L89
.L89:
	tst	ip, #8
	beq	.L98
	ldr	r3, .L108+36
	mov	lr, pc
	bx	r3
	ldr	lr, [r4]
	ldrh	ip, [fp]
	b	.L88
.L91:
	tst	ip, #8
	beq	.L98
	mov	lr, pc
	bx	r8
	ldr	lr, [r4]
	ldrh	ip, [fp]
	b	.L88
.L92:
	mov	lr, pc
	bx	r5
	ldr	lr, [r4]
	ldrh	ip, [fp]
	b	.L88
.L93:
	mov	lr, pc
	bx	r6
	ldr	lr, [r4]
	ldrh	ip, [fp]
	b	.L88
.L94:
	tst	ip, #8
	beq	.L98
	mov	lr, pc
	bx	r9
	ldr	lr, [r4]
	ldrh	ip, [fp]
	b	.L88
.L95:
	tst	ip, #8
	beq	.L98
	tst	r3, #8
	beq	.L107
.L98:
	mov	ip, r3
	b	.L88
.L96:
	tst	ip, #8
	beq	.L98
	tst	r3, #8
	bne	.L98
	ldr	r3, .L108+40
	mov	lr, pc
	bx	r3
	ldr	lr, [r4]
	ldrh	ip, [fp]
	b	.L88
.L107:
	ldr	r3, .L108+44
	mov	lr, pc
	bx	r3
	ldr	lr, [r4]
	ldrh	ip, [fp]
	b	.L88
.L109:
	.align	2
.L108:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	instructions.part.0
	.word	game
	.word	pause
	.word	win.part.0
	.word	67109120
	.word	lose.part.0
	.word	goToStory
	.word	goToInstructions
	.size	main, .-main
	.text
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
	b	win
	.size	lose, .-lose
	.comm	state,4,4
	.global	notTheFirstTime
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	lives,4,4
	.comm	shadowOAM,1024,4
	.comm	player,40,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	notTheFirstTime, %object
	.size	notTheFirstTime, 4
notTheFirstTime:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
