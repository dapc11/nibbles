	.file	"test.c"
	.text
	.globl	start_game
	.type	start_game, @function
start_game:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$1636, %esp
	.cfi_offset 3, -12
	movl	$0, -16(%ebp)
	jmp	.L2
.L3:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	leal	-1624(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	addl	$1, -16(%ebp)
.L2:
	cmpl	$399, -16(%ebp)
	jle	.L3
	movl	$0, -16(%ebp)
	jmp	.L4
.L5:
	call	rand
	movl	%eax, %ecx
	movl	$954437177, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	leal	1(%edx), %ebx
	call	rand
	movl	%eax, %ecx
	movl	$954437177, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	%ebx, %eax
	sall	$2, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	$-999999, -1624(%ebp,%eax,4)
	addl	$1, -16(%ebp)
.L4:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L5
	movl	8(%ebp), %eax
	movl	%eax, -812(%ebp)
	movl	$-1, -20(%ebp)
.L18:
	movl	$100000, (%esp)
	call	usleep
	call	nib_poll_kbd
	movl	%eax, -24(%ebp)
	cmpl	$258, -24(%ebp)
	jne	.L6
	movl	$-20, -20(%ebp)
.L6:
	cmpl	$259, -24(%ebp)
	jne	.L7
	movl	$20, -20(%ebp)
.L7:
	cmpl	$260, -24(%ebp)
	jne	.L8
	movl	$1, -20(%ebp)
.L8:
	cmpl	$261, -24(%ebp)
	jne	.L9
	movl	$-1, -20(%ebp)
.L9:
	movl	$1, -12(%ebp)
	jmp	.L10
.L17:
	movl	$1, -16(%ebp)
	jmp	.L11
.L16:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	-1624(%ebp,%eax,4), %eax
	leal	-1(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	%ecx, -1624(%ebp,%eax,4)
	leal	-1624(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	sall	$2, %eax
	leal	(%ecx,%eax), %edx
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$0, -20(%ebp)
	setle	%dl
	movzbl	%dl, %edx
	movl	8(%ebp), %ecx
	movl	%ecx, %ebx
	subl	%edx, %ebx
	movl	%ebx, %edx
	cmpl	%edx, %eax
	jne	.L12
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	-1624(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jg	.L12
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	-1624(%ebp,%eax,4), %eax
	cmpl	$-999999, %eax
	jge	.L13
	addl	$1, 8(%ebp)
	call	rand
	movl	%eax, %ecx
	movl	$954437177, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	leal	1(%edx), %ebx
	call	rand
	movl	%eax, %ecx
	movl	$954437177, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	addl	$1, %edx
	movl	%ebx, %eax
	sall	$2, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	$-999999, -1624(%ebp,%eax,4)
.L13:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%eax, -1624(%ebp,%edx,4)
.L12:
	movl	$45, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	nib_put_scr
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	-1624(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jle	.L14
	movl	$35, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	nib_put_scr
.L14:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	-1624(%ebp,%eax,4), %eax
	cmpl	$-999999, %eax
	jge	.L15
	movl	$48, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	nib_put_scr
.L15:
	addl	$1, -16(%ebp)
.L11:
	cmpl	$18, -16(%ebp)
	jle	.L16
	addl	$1, -12(%ebp)
.L10:
	cmpl	$18, -12(%ebp)
	jle	.L17
	jmp	.L18
	.cfi_endproc
.LFE0:
	.size	start_game, .-start_game
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
