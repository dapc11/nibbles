#% shows that you are refering to a register.
#$ shows that you are refering to a constant number.
#-1073741823 = apple value, which allows the palyer to play for ~10.2 years
#(2^31-1)/2 is the formula since gamegrid should containt both "air" and apples.

.globl start_game
start_game:
	call 	nib_init
	pushl	%ebp			#Pushes the base pointer into the stack
	movl	%esp, %ebp		#Allows us to know where the parameters for the stack are
	pushl	%ebx			#
	subl	$1640, %esp		#Reserves 1636 bytes on the stack
	movl	$0, -16(%ebp)		#x var : Create vaiable at memory adress -16 and sets it to 0



.INIT_GAMEGRID:
	movl	-16(%ebp), %eax		#
	leal	0(,%eax,4), %edx	#gets gamegrid element at position of x var
	leal	-1624(%ebp), %eax	#---
	addl	%edx, %eax		#---
	movl	$0, (%eax)		#set all values in gamegrid to 0
	addl	$1, -16(%ebp)		#x var++
	cmpl 	$400, -16(%ebp)		#For as long as pointer is less than 400
	jl	.INIT_GAMEGRID		
	movl	$0, -16(%ebp)		#set x var to 0 for next loop
	
.GENERATE_APPLES:
	call	_PLACE_APPLE
	
	addl	$1, -16(%ebp)			#increase x by 1
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax			#rerun .GENERATE_APPLES to place more apples if it should
	jl	.GENERATE_APPLES

	movl	8(%ebp), %eax			#add nibble length to aex
	movl	%eax, -812(%ebp)		#place nibble in center
	movl	$-1, -20(%ebp)			#set default direction to move

	movl	$0, -12(%ebp)	
.DRAW_BORDERS_LOOP:

	movl	$35, 8(%esp)			#set char to "#"
	movl	$0, %eax
	movl	%eax, 4(%esp)			#set y value
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)			#set x value
	call	nib_put_scr			#draw upper wall

	movl	$35, 8(%esp)			#set char to "#"
	movl	$19, %eax
	movl	%eax, 4(%esp)			#set y value
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)			#set x value
	call	nib_put_scr			#draw lower wall

	movl	$35, 8(%esp)			#set char to "#"
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)			#set y value
	movl	$0, %eax
	movl	%eax, (%esp)			#set x value
	call	nib_put_scr			#draw left wall

	movl	$35, 8(%esp)			#set char to "#"
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)			#set y value
	movl	$19, %eax
	movl	%eax, (%esp)			#set x value
	call	nib_put_scr			#draw right wall

	addl	$1, -12(%ebp)
	cmpl	$20, -12(%ebp)
	jl .DRAW_BORDERS_LOOP

.MAIN_UPDATE_LOOP:
	movl	$100000, (%esp)			#set sleep parameter
	call	usleep				#use sleep function
	call	nib_poll_kbd			#read keyboard
	movl	%eax, -24(%ebp)			#save keyboard key
	cmpl	$258, -24(%ebp)			#check if down key
	jne	.NOT_DOWN
	movl	$-20, -20(%ebp)			#set direction to move down
.NOT_DOWN:
	cmpl	$259, -24(%ebp)			#check up key
	jne	.NOT_UP
	movl	$20, -20(%ebp)			#set direction to move up
.NOT_UP:
	cmpl	$260, -24(%ebp)			#check left key
	jne	.NOT_LEFT
	movl	$1, -20(%ebp)			#set direction to move left
.NOT_LEFT:
	cmpl	$261, -24(%ebp)			#check right key
	jne	.NOT_RIGHT
	movl	$-1, -20(%ebp)			#set direction to move right
.NOT_RIGHT:

	movl	$1, -12(%ebp)			#set y value to 1 to skip first row
	jmp	.START_Y_LOOP
.Y_LOOP:					#y loop

	movl	$1, -16(%ebp)			#set x value to 1 to skip first colum
	jmp	.START_X_LOOP
.X_LOOP:					#x loop
	
	call	_GET_GRID_ELEMENT
	movl	-1624(%ebp,%eax,4), %eax	#get grid element at x, y
	leal	-1(%eax), %ecx			#element -1
	movl	-12(%ebp), %edx			
	call	_GET_GRID_ELEMENT 
	movl	%ecx, -1624(%ebp,%eax,4)	#add modified elemt to grid
	leal	-1624(%ebp), %ecx		
	call 	_GET_GRID_ELEMENT
	leal	(%ecx,%eax, 4), %edx		#save grid element
	addl 	-20(%ebp), %eax			#add directin to pointer to element			
	movl	-1624(%ebp,%eax,4), %eax

	movl	8(%ebp), %edx			#get len	
	cmpl	$0, -20(%ebp)			#checks if len should decrease
		jg .NOT_DECREASED_LEN
	subl $1, %edx				#decrease length by 1
.NOT_DECREASED_LEN:
	cmpl	%edx, %eax			#check for nibble head behind x,y
	jne	.NO_HEAD
	call 	_GET_GRID_ELEMENT
	cmpl	$0, -1624(%ebp,%eax,4)		#check so its not a body part collision
	jg	.NO_HEAD

	call 	_GET_GRID_ELEMENT
	cmpl	$-1073741823, -1624(%ebp,%eax,4)	#check if it was an apple to pick up
	jge	.NO_APPLE
	addl	$1, 8(%ebp)			#increase nibble size
	call	_PLACE_APPLE			#calling function to place apple
.NO_APPLE:
	
	call	_GET_GRID_ELEMENT
	movl	8(%ebp), %edx			#get nibble size
	movl	%edx, -1624(%ebp,%eax,4)	#place head at x,y
.NO_HEAD:

	movl	$32, 8(%esp)			#set air char " "
	movl	-12(%ebp), %eax			#get y value
	movl	%eax, 4(%esp)			#set y value
	movl	-16(%ebp), %eax			#get x value
	movl	%eax, (%esp)			#set x value
	call	nib_put_scr			#draw char at x,y

	call _GET_GRID_ELEMENT
	movl	-1624(%ebp,%eax,4), %eax	#get grid element value
	cmpl	$0, %eax			#check if it's a snake part
	jle	.NO_NIBBLE_PART
	movl	$48, 8(%esp)			#set char to "0"
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)			#set y
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)			#set x
	call	nib_put_scr			#draw nibble part at x,y
	
.NO_NIBBLE_PART:

	call _GET_GRID_ELEMENT
	movl	-1624(%ebp,%eax,4), %eax	#get grid element value
	cmpl	$-1073741823, %eax			#check if apple
	jge	.IS_NOT_APPLE
	movl	$36, 8(%esp)			#set char to "$"
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)			#set y value
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)			#set x value
	call	nib_put_scr			#draw apple at x,y

.IS_NOT_APPLE:
	addl	$1, -16(%ebp)			#increase x value for loop
.START_X_LOOP:
	cmpl	$18, -16(%ebp)			#shoud continue x loop
	jle	.X_LOOP

	addl	$1, -12(%ebp)			#increase y value for loop
.START_Y_LOOP:
	
	cmpl	$18, -12(%ebp)			#should continue y loop
	jle	.Y_LOOP

	
	movl	$21, -12(%ebp)			#y start value
	movl	$0, %ecx			#set default quit value to quit if not changed
.CHECK_QUIT_LOOP:
	movl	-12(%ebp), %eax			#get grid element position
	movl	-1624(%ebp,%eax,4), %eax	#get grid element value
	cmpl	$0, %eax
	jle 	.NO_NIBBLE
	movl	$1, %ecx			#if found snake part
.NO_NIBBLE:
	addl 	$1, -12(%ebp)			#next position for loop
	cmpl	$400, -12(%ebp)			#when to qiut the loop
	jl 	.CHECK_QUIT_LOOP

	cmpl	$0, %ecx			#quit if qiut value was not changed
	je 	.QUIT
	


	jmp	.MAIN_UPDATE_LOOP		#continue main update loop


_PLACE_APPLE:
	call rand
	movl $0, %edx                           #requires to be zero for div
	movl $18, %ebx                         
	div %ebx                                #modulo rand by 18 to %edx
	addl $1, %edx                           #skip a column
	movl %edx, %esi                         #store

	call rand
	movl $0, %edx
	movl $18, %ebx
	div %ebx
	addl $1, %edx                           #skip a row

	movl    %edx, %eax
	imull   $20, %eax                       #times by 20 to merge x, y values
	addl    %esi, %eax                      #combine values
	movl    $-1073741823, -1624(%ebp,%eax,4)    #place apples at x, y
	ret


_GET_GRID_ELEMENT:
	movl	-12(%ebp), %edx			#gets y value
	movl	%edx, %eax
	imull 	$20, %eax			#y*20 to combine
	movl	-16(%ebp), %edx			#gets x variable
	addl	%edx, %eax			#add togeher x and y
	ret

.QUIT:
	call	nib_end

