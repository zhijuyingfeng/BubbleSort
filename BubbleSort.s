	.file	"BubbleSort.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$8, -48(%rbp)
	movl	$6, -44(%rbp)
	movl	$9, -40(%rbp)
	movl	$2, -36(%rbp)
	movl	$3, -32(%rbp)
	movl	$5, -28(%rbp)
	movl	$4, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, -16(%rbp)
	movl	$7, -12(%rbp)
	movl	$0, -60(%rbp)
	jmp	.L2
.L6:
	movl	$0, -56(%rbp)
	jmp	.L3
.L5:
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jbe	.L4
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, -52(%rbp)
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movl	-56(%rbp), %eax
	cltq
	movl	%edx, -48(%rbp,%rax,4)
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	-52(%rbp), %edx
	cltq
	movl	%edx, -48(%rbp,%rax,4)
.L4:
	addl	$1, -56(%rbp)
.L3:
	movl	$9, %eax
	subl	-60(%rbp), %eax
	cmpl	%eax, -56(%rbp)
	jl	.L5
	addl	$1, -60(%rbp)
.L2:
	cmpl	$8, -60(%rbp)
	jle	.L6
	movl	$0, -60(%rbp)
	jmp	.L7
.L8:
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -60(%rbp)
.L7:
	cmpl	$9, -60(%rbp)
	jle	.L8
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
