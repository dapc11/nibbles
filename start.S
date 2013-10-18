.data
usage:	.string "Usage : %s LEN APPLES\n"


.bss

.text
.globl _start
_start:
	movl %esp, %ebp

	cmpl $3, (%ebp)
	je input_is_valid
	pushl 4(%ebp)
	pushl $usage
	call printf
	addl $8, %esp
	jmp quit_game

input_is_valid:
	pushl 12(%ebp)		#Push nrOfApples into the stack
	call atoi		#Converts it to an int
	addl $4, %esp		#Gives the parameter 4 bytes of space
	pushl %eax

	pushl 8(%ebp)
	call atoi
	addl $4, %esp
	pushl %eax

	call start_game
	addl $8, %esp

quit_game:

	pushl $-1
	call exit
