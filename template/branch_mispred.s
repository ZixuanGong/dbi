	.file	"branch_mispred.c"
	.text
.Ltext0:
	.p2align 4,,15
	.globl	perf_event_open
	.type	perf_event_open, @function
perf_event_open:
.LFB89:
	.file 1 "branch_mispred.c"
	.loc 1 39 0
	.cfi_startproc
.LVL0:
	subq	$8, %rsp
.LCFI0:
	.cfi_def_cfa_offset 16
	.loc 1 40 0
	movq	%r8, %r9
	xorl	%eax, %eax
	movl	%ecx, %r8d
.LVL1:
	movl	%edx, %ecx
.LVL2:
	movl	%esi, %edx
.LVL3:
	movq	%rdi, %rsi
.LVL4:
	movl	$298, %edi
.LVL5:
	call	syscall
.LVL6:
	.loc 1 41 0
	addq	$8, %rsp
.LCFI1:
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE89:
	.size	perf_event_open, .-perf_event_open
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Failed to get time stamp"
	.text
	.p2align 4,,15
	.globl	get_timestamp
	.type	get_timestamp, @function
get_timestamp:
.LFB91:
	.loc 1 244 0
	.cfi_startproc
.LVL7:
	subq	$40, %rsp
.LCFI2:
	.cfi_def_cfa_offset 48
	.loc 1 247 0
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	.loc 1 244 0
	movsd	%xmm0, 8(%rsp)
	.loc 1 247 0
	call	gettimeofday
.LVL8:
	testl	%eax, %eax
	jne	.L3
	.loc 1 248 0
	cvtsi2sdq	24(%rsp), %xmm2
	mulsd	.LC1(%rip), %xmm2
	cvtsi2sdq	16(%rsp), %xmm1
	addsd	%xmm2, %xmm1
	subsd	8(%rsp), %xmm1
	.loc 1 253 0
	addq	$40, %rsp
	.cfi_remember_state
.LCFI3:
	.cfi_def_cfa_offset 8
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L3:
.LCFI4:
	.cfi_restore_state
.LVL9:
.LBB62:
.LBB63:
.LBB64:
.LBB65:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 105 0
	movl	$.LC2, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movsd	.LC0(%rip), %xmm1
.LBE65:
.LBE64:
.LBE63:
.LBE62:
	.loc 1 253 0
	addq	$40, %rsp
.LCFI5:
	.cfi_def_cfa_offset 8
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE91:
	.size	get_timestamp, .-get_timestamp
	.p2align 4,,15
	.globl	createData
	.type	createData, @function
createData:
.LFB92:
	.loc 1 261 0
	.cfi_startproc
.LVL10:
	pushq	%r12
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
.LCFI7:
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	3000(%rdi), %rbp
	pushq	%rbx
.LCFI8:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	subq	$16, %rsp
.LCFI9:
	.cfi_def_cfa_offset 48
	.loc 1 261 0
	movsd	%xmm0, 8(%rsp)
.LVL11:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 1 266 0
	call	rand
.LVL12:
	cvtsi2sd	%eax, %xmm1
	.loc 1 268 0
	movsd	8(%rsp), %xmm0
	.loc 1 266 0
	mulsd	.LC3(%rip), %xmm1
	.loc 1 268 0
	ucomisd	%xmm1, %xmm0
	.loc 1 266 0
	seta	(%rbx)
	.loc 1 272 0
	addq	$1, %rbx
.LVL13:
	.loc 1 265 0
	cmpq	%rbp, %rbx
	jne	.L7
	.loc 1 274 0
	movb	$0, 3000(%r12)
	.loc 1 276 0
	addq	$16, %rsp
.LCFI10:
	.cfi_def_cfa_offset 32
	movq	%rbx, %rax
.LVL14:
	popq	%rbx
.LCFI11:
	.cfi_def_cfa_offset 24
.LVL15:
	popq	%rbp
.LCFI12:
	.cfi_def_cfa_offset 16
	popq	%r12
.LCFI13:
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE92:
	.size	createData, .-createData
	.p2align 4,,15
	.globl	createOffsets
	.type	createOffsets, @function
createOffsets:
.LFB93:
	.loc 1 284 0
	.cfi_startproc
.LVL16:
	pushq	%rbp
.LCFI14:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
.LCFI15:
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%ebx, %ebx
	subq	$8, %rsp
.LCFI16:
	.cfi_def_cfa_offset 32
.LVL17:
	.p2align 4,,10
	.p2align 3
.L10:
.LBB66:
	.loc 1 287 0 discriminator 2
	call	rand
.LVL18:
	cvtsi2sd	%eax, %xmm0
	mulsd	.LC3(%rip), %xmm0
	.loc 1 288 0 discriminator 2
	mulsd	.LC4(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
.LVL19:
	movl	%eax, 0(%rbp,%rbx)
	addq	$4, %rbx
.LBE66:
	.loc 1 286 0 discriminator 2
	cmpq	$400000000, %rbx
	jne	.L10
	.loc 1 291 0
	addq	$8, %rsp
.LCFI17:
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
.LCFI18:
	.cfi_def_cfa_offset 16
	popq	%rbp
.LCFI19:
	.cfi_def_cfa_offset 8
.LVL20:
	ret
	.cfi_endproc
.LFE93:
	.size	createOffsets, .-createOffsets
	.section	.rodata.str1.1
.LC5:
	.string	"Opening performance counter"
.LC6:
	.string	"argument error!"
.LC7:
	.string	"Loop start!"
.LC9:
	.string	"branch_mispred.c"
.LC10:
	.string	"rc"
.LC11:
	.string	"Loop stop!"
.LC12:
	.string	"Elapsed time: %.9lf seconds\n"
.LC13:
	.string	"CPU Cycles:           %lu \n"
.LC14:
	.string	"Instructions:         %lu \n"
.LC15:
	.string	"IPC:                  %lf\n"
.LC16:
	.string	"Branch misses:        %lu \n"
.LC17:
	.string	"Branch instructions:  %lu \n"
.LC19:
	.string	"Branch mispred. rate: %lf%%\n"
.LC21:
	.string	"overall selectivity = %10.9f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC22:
	.string	"theoretical selectivity = %10.9f\n"
	.section	.rodata.str1.1
.LC23:
	.string	"w"
.LC24:
	.string	"/dev/null"
.LC25:
	.string	"%d "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB90:
	.loc 1 52 0
	.cfi_startproc
.LVL21:
	pushq	%r15
.LCFI20:
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
.LCFI21:
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
.LCFI22:
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
.LCFI23:
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
.LCFI24:
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	pushq	%rbx
.LCFI25:
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$12200, %rsp
.LCFI26:
	.cfi_def_cfa_offset 12256
	.loc 1 64 0
	movl	$0, attr(%rip)
	.loc 1 66 0
	andb	$-2, attr+40(%rip)
	.loc 1 52 0
	movq	%fs:40, %rax
	movq	%rax, 12184(%rsp)
	xorl	%eax, %eax
.LVL22:
	.loc 1 65 0
	movq	$0, attr+8(%rip)
	.loc 1 67 0
	call	getpid
.LVL23:
	movl	$-1, %ecx
	xorl	%r8d, %r8d
	movl	%eax, %esi
	movl	%ecx, %edx
	movl	$attr, %edi
	call	perf_event_open
	.loc 1 68 0
	testl	%eax, %eax
	.loc 1 67 0
	movl	%eax, 16(%rsp)
.LVL24:
	.loc 1 68 0
	js	.L46
.LVL25:
.L13:
	.loc 1 74 0
	andb	$-2, attr+112(%rip)
	.loc 1 72 0
	movl	$0, attr+72(%rip)
	.loc 1 73 0
	movq	$5, attr+80(%rip)
	.loc 1 75 0
	call	getpid
	movl	$-1, %ecx
	xorl	%r8d, %r8d
	movl	%eax, %esi
	movl	%ecx, %edx
	movl	$attr+72, %edi
	call	perf_event_open
	.loc 1 76 0
	testl	%eax, %eax
	.loc 1 75 0
	movl	%eax, 28(%rsp)
.LVL26:
	.loc 1 76 0
	js	.L47
.LVL27:
.L14:
	.loc 1 82 0
	andb	$-2, attr+184(%rip)
	.loc 1 80 0
	movl	$0, attr+144(%rip)
	.loc 1 81 0
	movq	$4, attr+152(%rip)
	.loc 1 83 0
	call	getpid
	movl	$-1, %ecx
	xorl	%r8d, %r8d
	movl	%eax, %esi
	movl	%ecx, %edx
	movl	$attr+144, %edi
	call	perf_event_open
	.loc 1 84 0
	testl	%eax, %eax
	.loc 1 83 0
	movl	%eax, 32(%rsp)
.LVL28:
	.loc 1 84 0
	js	.L48
.LVL29:
.L15:
	.loc 1 90 0
	andb	$-2, attr+256(%rip)
	.loc 1 88 0
	movl	$0, attr+216(%rip)
	.loc 1 89 0
	movq	$1, attr+224(%rip)
	.loc 1 91 0
	call	getpid
	movl	$-1, %ecx
	xorl	%r8d, %r8d
	movl	%eax, %esi
	movl	%ecx, %edx
	movl	$attr+216, %edi
	call	perf_event_open
	.loc 1 92 0
	testl	%eax, %eax
	.loc 1 91 0
	movl	%eax, 36(%rsp)
.LVL30:
	.loc 1 92 0
	js	.L49
.LVL31:
.L16:
	.loc 1 97 0
	cmpl	$5, %ebp
	jne	.L50
.LVL32:
.LBB67:
.LBB68:
	.file 3 "/usr/include/stdlib.h"
	.loc 3 281 0
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	call	strtod
.LVL33:
.LBE68:
.LBE67:
.LBB70:
.LBB71:
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
.LBE71:
.LBE70:
.LBB74:
.LBB69:
	movsd	%xmm0, 40(%rsp)
.LVL34:
.LBE69:
.LBE74:
.LBB75:
.LBB72:
	call	strtod
.LVL35:
.LBE72:
.LBE75:
.LBB76:
.LBB77:
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
.LBE77:
.LBE76:
.LBB80:
.LBB73:
	movsd	%xmm0, 48(%rsp)
.LVL36:
.LBE73:
.LBE80:
.LBB81:
.LBB78:
	call	strtod
.LVL37:
.LBE78:
.LBE81:
.LBB82:
.LBB83:
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
.LBE83:
.LBE82:
.LBB86:
.LBB79:
	movsd	%xmm0, 56(%rsp)
.LVL38:
.LBE79:
.LBE86:
.LBB87:
.LBB84:
	call	strtod
.LVL39:
.LBE84:
.LBE87:
	.loc 1 109 0
	movl	$400000000, %edi
.LBB88:
.LBB85:
	.loc 3 281 0
	movsd	%xmm0, 64(%rsp)
.LBE85:
.LBE88:
	.loc 1 109 0
	call	malloc
	.loc 1 110 0
	movl	$400000000, %edi
	.loc 1 109 0
	movq	%rax, %r12
.LVL40:
	.loc 1 110 0
	call	malloc
.LVL41:
	.loc 1 111 0
	movl	$400000000, %edi
	.loc 1 110 0
	movq	%rax, %rbp
.LVL42:
	.loc 1 111 0
	call	malloc
.LVL43:
	.loc 1 112 0
	movl	$400000000, %edi
	.loc 1 111 0
	movq	%rax, %r14
.LVL44:
	.loc 1 112 0
	call	malloc
.LVL45:
	.loc 1 113 0
	movl	$400000000, %edi
	.loc 1 112 0
	movq	%rax, %r15
.LVL46:
	.loc 1 113 0
	call	malloc
.LVL47:
	.loc 1 116 0
	xorl	%edi, %edi
	.loc 1 113 0
	movq	%rax, %r13
.LVL48:
	.loc 1 116 0
	call	time
.LVL49:
	.loc 1 117 0
	movl	%eax, %edi
	call	srand
.LVL50:
	.loc 1 120 0
	leaq	144(%rsp), %rdi
	movsd	40(%rsp), %xmm0
	call	createData
	.loc 1 121 0
	leaq	3152(%rsp), %rdi
	movsd	48(%rsp), %xmm0
	call	createData
	.loc 1 122 0
	leaq	6160(%rsp), %rdi
	movsd	56(%rsp), %xmm0
	call	createData
	.loc 1 123 0
	movsd	64(%rsp), %xmm0
	leaq	9168(%rsp), %rdi
	call	createData
	.loc 1 126 0
	movq	%r12, %rdi
	call	createOffsets
	.loc 1 127 0
	movq	%rbp, %rdi
	call	createOffsets
	.loc 1 128 0
	movq	%r14, %rdi
	call	createOffsets
	.loc 1 129 0
	movq	%r15, %rdi
	call	createOffsets
.LVL51:
	.loc 2 105 0
	movl	$.LC7, %edi
	call	puts
	.loc 1 133 0
	movq	stdout(%rip), %rdi
	call	fflush
	.loc 1 134 0
	xorpd	%xmm0, %xmm0
	call	get_timestamp
	movsd	%xmm0, 72(%rsp)
.LVL52:
	.loc 1 137 0
#APP
# 137 "branch_mispred.c" 1
	nop;
# 0 "" 2
.LVL53:
#NO_APP
.LBB89:
.LBB90:
	.file 4 "/usr/include/x86_64-linux-gnu/bits/unistd.h"
	.loc 4 45 0
	movl	16(%rsp), %edi
	leaq	80(%rsp), %rsi
	movl	$8, %edx
	call	read
.LVL54:
.LBE90:
.LBE89:
	.loc 1 138 0
	testl	%eax, %eax
	je	.L51
.LVL55:
.LBB91:
.LBB92:
	.loc 4 45 0
	movl	28(%rsp), %edi
	.loc 1 139 0
	leaq	88(%rsp), %rsi
	.loc 4 45 0
	movl	$8, %edx
	call	read
.LVL56:
.LBE92:
.LBE91:
	.loc 1 139 0
	testl	%eax, %eax
	je	.L52
.LVL57:
.LBB93:
.LBB94:
	.loc 4 45 0
	movl	32(%rsp), %edi
	.loc 1 140 0
	leaq	96(%rsp), %rsi
	.loc 4 45 0
	movl	$8, %edx
	call	read
.LVL58:
.LBE94:
.LBE93:
	.loc 1 140 0
	testl	%eax, %eax
	je	.L53
.LVL59:
.LBB95:
.LBB96:
	.loc 4 45 0
	movl	36(%rsp), %edi
	.loc 1 141 0
	leaq	104(%rsp), %rsi
	.loc 4 45 0
	movl	$8, %edx
	call	read
.LVL60:
.LBE96:
.LBE95:
	.loc 1 141 0
	testl	%eax, %eax
	je	.L54
	.loc 1 142 0
#APP
# 142 "branch_mispred.c" 1
	nop;
# 0 "" 2
#NO_APP
	xorl	%eax, %eax
.LVL61:
	.loc 1 55 0
	xorl	%ebx, %ebx
.LVL62:
	.p2align 4,,10
	.p2align 3
.L24:
	.loc 1 149 0
	movslq	0(%rbp,%rax,4), %rcx
	movslq	(%r12,%rax,4), %rdx
	movzbl	3152(%rsp,%rcx), %ecx
	testb	%cl, 144(%rsp,%rdx)
	je	.L23
	.loc 1 150 0
	movslq	%ebx, %rdx
	.loc 1 151 0
	movslq	(%r14,%rax,4), %rcx
	.loc 1 150 0
	movl	%eax, 0(%r13,%rdx,4)
	.loc 1 151 0
	movslq	(%r15,%rax,4), %rdx
	movzbl	9168(%rsp,%rdx), %edx
	andb	6160(%rsp,%rcx), %dl
	movsbl	%dl, %edx
	addl	%edx, %ebx
.LVL63:
.L23:
	addq	$1, %rax
	.loc 1 147 0
	cmpq	$100000000, %rax
	jne	.L24
	.loc 1 192 0
#APP
# 192 "branch_mispred.c" 1
	nop;
# 0 "" 2
.LVL64:
#NO_APP
.LBB97:
.LBB98:
	.loc 4 45 0
	movl	16(%rsp), %edi
	leaq	112(%rsp), %rsi
	movl	$8, %edx
	call	read
.LVL65:
.LBE98:
.LBE97:
	.loc 1 193 0
	testl	%eax, %eax
	je	.L55
.LVL66:
.LBB99:
.LBB100:
	.loc 4 45 0
	movl	28(%rsp), %edi
	.loc 1 194 0
	leaq	120(%rsp), %rsi
	.loc 4 45 0
	movl	$8, %edx
	call	read
.LVL67:
.LBE100:
.LBE99:
	.loc 1 194 0
	testl	%eax, %eax
	je	.L56
.LVL68:
.LBB101:
.LBB102:
	.loc 4 45 0
	movl	32(%rsp), %edi
	.loc 1 195 0
	leaq	128(%rsp), %rsi
	.loc 4 45 0
	movl	$8, %edx
	call	read
.LVL69:
.LBE102:
.LBE101:
	.loc 1 195 0
	testl	%eax, %eax
	je	.L57
.LVL70:
.LBB103:
.LBB104:
	.loc 4 45 0
	movl	36(%rsp), %edi
	.loc 1 196 0
	leaq	136(%rsp), %rsi
	.loc 4 45 0
	movl	$8, %edx
	call	read
.LVL71:
.LBE104:
.LBE103:
	.loc 1 196 0
	testl	%eax, %eax
	je	.L58
	.loc 1 198 0
#APP
# 198 "branch_mispred.c" 1
	nop;
# 0 "" 2
	.loc 1 201 0
#NO_APP
	movl	16(%rsp), %edi
	call	close
.LVL72:
	.loc 1 202 0
	movl	28(%rsp), %edi
	call	close
	.loc 1 203 0
	movl	32(%rsp), %edi
	call	close
	.loc 1 204 0
	movl	36(%rsp), %edi
	call	close
	.loc 1 206 0
	movsd	72(%rsp), %xmm0
	call	get_timestamp
.LVL73:
	.loc 2 105 0
	movl	$.LC11, %edi
	movsd	%xmm0, (%rsp)
	call	puts
.LVL74:
.LBB105:
.LBB106:
	movsd	(%rsp), %xmm0
	movl	$.LC12, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
.LVL75:
.LBE106:
.LBE105:
	.loc 1 210 0
	movq	112(%rsp), %rdx
	subq	80(%rsp), %rdx
.LBB107:
.LBB108:
	.loc 2 105 0
	movl	$.LC13, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL76:
.LBE108:
.LBE107:
	.loc 1 211 0
	movq	136(%rsp), %rdx
	subq	104(%rsp), %rdx
.LBB109:
.LBB110:
	.loc 2 105 0
	xorl	%eax, %eax
	movl	$.LC14, %esi
	movl	$1, %edi
	call	__printf_chk
.LVL77:
.LBE110:
.LBE109:
	.loc 1 212 0
	movq	136(%rsp), %rax
	testq	%rax, %rax
	js	.L29
	cvtsi2sdq	%rax, %xmm0
.L30:
	movq	104(%rsp), %rax
	testq	%rax, %rax
	js	.L31
	cvtsi2sdq	%rax, %xmm1
.L32:
	movq	112(%rsp), %rax
	subq	80(%rsp), %rax
	subsd	%xmm1, %xmm0
	js	.L33
	cvtsi2sdq	%rax, %xmm1
.L34:
	divsd	%xmm1, %xmm0
.LBB111:
.LBB112:
	.loc 2 105 0
	movl	$.LC15, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
.LVL78:
.LBE112:
.LBE111:
	.loc 1 213 0
	movq	120(%rsp), %rdx
	subq	88(%rsp), %rdx
.LBB113:
.LBB114:
	.loc 2 105 0
	movl	$.LC16, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL79:
.LBE114:
.LBE113:
	.loc 1 214 0
	movq	128(%rsp), %rdx
	subq	96(%rsp), %rdx
.LBB115:
.LBB116:
	.loc 2 105 0
	xorl	%eax, %eax
	movl	$.LC17, %esi
	movl	$1, %edi
	call	__printf_chk
.LVL80:
.LBE116:
.LBE115:
	.loc 1 215 0
	movq	120(%rsp), %rax
	testq	%rax, %rax
	js	.L35
	cvtsi2sdq	%rax, %xmm0
.L36:
	movq	88(%rsp), %rax
	testq	%rax, %rax
	js	.L37
	cvtsi2sdq	%rax, %xmm1
.L38:
	subsd	%xmm1, %xmm0
	movq	128(%rsp), %rax
	subq	96(%rsp), %rax
	mulsd	.LC18(%rip), %xmm0
	js	.L39
	cvtsi2sdq	%rax, %xmm1
.L40:
	divsd	%xmm1, %xmm0
.LBB117:
.LBB118:
	.loc 2 105 0
	movl	$.LC19, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
.LVL81:
	movl	$10, %edi
	call	putchar
.LVL82:
.LBE118:
.LBE117:
	.loc 1 217 0
	cvtsi2sd	%ebx, %xmm0
.LBB119:
.LBB120:
	.loc 2 105 0
	movl	$.LC21, %esi
	movl	$1, %edi
	movl	$1, %eax
.LBE120:
.LBE119:
	.loc 1 217 0
	divsd	.LC20(%rip), %xmm0
.LBB122:
.LBB121:
	.loc 2 105 0
	call	__printf_chk
.LVL83:
.LBE121:
.LBE122:
	.loc 1 218 0
	movsd	40(%rsp), %xmm0
.LBB123:
.LBB124:
	.loc 2 105 0
	movl	$.LC22, %esi
	movl	$1, %edi
	movl	$1, %eax
.LBE124:
.LBE123:
	.loc 1 218 0
	mulsd	48(%rsp), %xmm0
	mulsd	56(%rsp), %xmm0
	mulsd	64(%rsp), %xmm0
.LBB126:
.LBB125:
	.loc 2 105 0
	call	__printf_chk
.LBE125:
.LBE126:
	.loc 1 222 0
	movl	$.LC23, %esi
	movl	$.LC24, %edi
	call	fopen
	.loc 1 223 0
	testl	%ebx, %ebx
	.loc 1 222 0
	movq	%rax, 16(%rsp)
.LVL84:
	.loc 1 223 0
	jle	.L41
	xorl	%r8d, %r8d
.LVL85:
	.p2align 4,,10
	.p2align 3
.L42:
.LBB127:
.LBB128:
	.loc 2 98 0 discriminator 2
	movl	0(%r13,%r8,4), %ecx
	movq	16(%rsp), %rdi
	xorl	%eax, %eax
	movl	$.LC25, %edx
	movl	$1, %esi
	movq	%r8, (%rsp)
	call	__fprintf_chk
	movq	(%rsp), %r8
	addq	$1, %r8
.LBE128:
.LBE127:
	.loc 1 223 0 discriminator 2
	cmpl	%r8d, %ebx
	jg	.L42
.LVL86:
.L41:
	.loc 1 226 0
	movq	16(%rsp), %rdi
	call	fclose
	.loc 1 229 0
	movq	%r12, %rdi
	call	free
	.loc 1 230 0
	movq	%rbp, %rdi
	call	free
	.loc 1 231 0
	movq	%r14, %rdi
	call	free
	.loc 1 232 0
	movq	%r15, %rdi
	call	free
	.loc 1 234 0
	movq	%r13, %rdi
	call	free
	.loc 1 236 0
	xorl	%eax, %eax
.LVL87:
.L18:
	.loc 1 237 0
	movq	12184(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L59
	addq	$12200, %rsp
	.cfi_remember_state
.LCFI27:
	.cfi_def_cfa_offset 56
	popq	%rbx
.LCFI28:
	.cfi_def_cfa_offset 48
	popq	%rbp
.LCFI29:
	.cfi_def_cfa_offset 40
	popq	%r12
.LCFI30:
	.cfi_def_cfa_offset 32
	popq	%r13
.LCFI31:
	.cfi_def_cfa_offset 24
	popq	%r14
.LCFI32:
	.cfi_def_cfa_offset 16
	popq	%r15
.LCFI33:
	.cfi_def_cfa_offset 8
	ret
.LVL88:
.L29:
.LCFI34:
	.cfi_restore_state
	.loc 1 212 0
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L30
.L31:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L32
.L33:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L34
.LVL89:
.L35:
	.loc 1 215 0
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L36
.L37:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L38
.L39:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L40
.LVL90:
.L47:
	.loc 1 77 0
	movl	$.LC5, %edi
	call	perror
	jmp	.L14
.LVL91:
.L49:
	.loc 1 93 0
	movl	$.LC5, %edi
	call	perror
.LVL92:
	.p2align 4,,3
	jmp	.L16
.LVL93:
.L46:
	.loc 1 69 0
	movl	$.LC5, %edi
	call	perror
	.p2align 4,,3
	jmp	.L13
.LVL94:
.L48:
	.loc 1 85 0
	movl	$.LC5, %edi
	call	perror
.LVL95:
	.p2align 4,,3
	jmp	.L15
.LVL96:
.L50:
	.loc 2 105 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 99 0
	orl	$-1, %eax
	jmp	.L18
.LVL97:
.L52:
	.loc 1 139 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$139, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL98:
.L56:
	.loc 1 194 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$194, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL99:
.L58:
	.loc 1 196 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$196, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL100:
.L59:
	.loc 1 237 0
	call	__stack_chk_fail
.LVL101:
.L55:
	.loc 1 193 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$193, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL102:
.L51:
	.loc 1 138 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$138, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL103:
.L57:
	.loc 1 195 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$195, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL104:
.L54:
	.loc 1 141 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$141, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL105:
.L53:
	.loc 1 140 0 discriminator 1
	movl	$__PRETTY_FUNCTION__.4766, %ecx
	movl	$140, %edx
	movl	$.LC9, %esi
	movl	$.LC10, %edi
	call	__assert_fail
.LVL106:
	.cfi_endproc
.LFE90:
	.size	main, .-main
	.comm	attr,288,32
	.section	.rodata
	.type	__PRETTY_FUNCTION__.4766, @object
	.size	__PRETTY_FUNCTION__.4766, 5
__PRETTY_FUNCTION__.4766:
	.string	"main"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	-1074790400
	.align 8
.LC1:
	.long	2696277389
	.long	1051772663
	.align 8
.LC3:
	.long	0
	.long	1040187392
	.align 8
.LC4:
	.long	0
	.long	1084715008
	.align 8
.LC18:
	.long	0
	.long	1079574528
	.align 8
.LC20:
	.long	0
	.long	1100470148
	.text
.Letext0:
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/libio.h"
	.file 9 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/time.h"
	.file 11 "/usr/include/stdint.h"
	.file 12 "/lib/modules/3.2.0-77-generic/build/include/asm-generic/int-ll64.h"
	.file 13 "/lib/modules/3.2.0-77-generic/build/include/linux/perf_event.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xedb
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF147
	.byte	0x1
	.long	.LASF148
	.long	.LASF149
	.quad	0
	.quad	0
	.long	.Ldebug_ranges0+0x150
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x5
	.byte	0xd4
	.long	0x3c
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x6
	.byte	0x8d
	.long	0x6d
	.uleb128 0x2
	.long	.LASF9
	.byte	0x6
	.byte	0x8e
	.long	0x6d
	.uleb128 0x2
	.long	.LASF10
	.byte	0x6
	.byte	0x8f
	.long	0x66
	.uleb128 0x2
	.long	.LASF11
	.byte	0x6
	.byte	0x95
	.long	0x6d
	.uleb128 0x2
	.long	.LASF12
	.byte	0x6
	.byte	0x97
	.long	0x6d
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.long	.LASF13
	.byte	0x6
	.byte	0xb4
	.long	0x6d
	.uleb128 0x6
	.byte	0x8
	.long	0xbe
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x2
	.long	.LASF15
	.byte	0x7
	.byte	0x31
	.long	0xd0
	.uleb128 0x7
	.long	.LASF45
	.byte	0xd8
	.byte	0x8
	.value	0x111
	.long	0x29d
	.uleb128 0x8
	.long	.LASF16
	.byte	0x8
	.value	0x112
	.long	0x66
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x8
	.value	0x117
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.long	.LASF18
	.byte	0x8
	.value	0x118
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.long	.LASF19
	.byte	0x8
	.value	0x119
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.long	.LASF20
	.byte	0x8
	.value	0x11a
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.long	.LASF21
	.byte	0x8
	.value	0x11b
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.long	.LASF22
	.byte	0x8
	.value	0x11c
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.long	.LASF23
	.byte	0x8
	.value	0x11d
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.long	.LASF24
	.byte	0x8
	.value	0x11e
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.long	.LASF25
	.byte	0x8
	.value	0x120
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x8
	.long	.LASF26
	.byte	0x8
	.value	0x121
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x8
	.long	.LASF27
	.byte	0x8
	.value	0x122
	.long	0xb8
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.long	.LASF28
	.byte	0x8
	.value	0x124
	.long	0x2db
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.long	.LASF29
	.byte	0x8
	.value	0x126
	.long	0x2e1
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.long	.LASF30
	.byte	0x8
	.value	0x128
	.long	0x66
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x8
	.long	.LASF31
	.byte	0x8
	.value	0x12c
	.long	0x66
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x8
	.long	.LASF32
	.byte	0x8
	.value	0x12e
	.long	0x74
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.long	.LASF33
	.byte	0x8
	.value	0x132
	.long	0x4a
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x8
	.long	.LASF34
	.byte	0x8
	.value	0x133
	.long	0x58
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x8
	.long	.LASF35
	.byte	0x8
	.value	0x134
	.long	0x2e7
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x8
	.long	.LASF36
	.byte	0x8
	.value	0x138
	.long	0x2f7
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x8
	.long	.LASF37
	.byte	0x8
	.value	0x141
	.long	0x7f
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x8
	.long	.LASF38
	.byte	0x8
	.value	0x14a
	.long	0xab
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x8
	.long	.LASF39
	.byte	0x8
	.value	0x14b
	.long	0xab
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x8
	.long	.LASF40
	.byte	0x8
	.value	0x14c
	.long	0xab
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x8
	.long	.LASF41
	.byte	0x8
	.value	0x14d
	.long	0xab
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.long	.LASF42
	.byte	0x8
	.value	0x14e
	.long	0x31
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x8
	.long	.LASF43
	.byte	0x8
	.value	0x150
	.long	0x66
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x8
	.value	0x152
	.long	0x2fd
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0
	.uleb128 0x9
	.long	.LASF150
	.byte	0x8
	.byte	0xb6
	.uleb128 0xa
	.long	.LASF46
	.byte	0x18
	.byte	0x8
	.byte	0xbc
	.long	0x2db
	.uleb128 0xb
	.long	.LASF47
	.byte	0x8
	.byte	0xbd
	.long	0x2db
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.long	.LASF48
	.byte	0x8
	.byte	0xbe
	.long	0x2e1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF49
	.byte	0x8
	.byte	0xc2
	.long	0x66
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2a4
	.uleb128 0x6
	.byte	0x8
	.long	0xd0
	.uleb128 0xc
	.long	0xbe
	.long	0x2f7
	.uleb128 0xd
	.long	0x3c
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x29d
	.uleb128 0xc
	.long	0xbe
	.long	0x30d
	.uleb128 0xd
	.long	0x3c
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x313
	.uleb128 0xe
	.long	0xbe
	.uleb128 0x2
	.long	.LASF50
	.byte	0x7
	.byte	0x67
	.long	0xad
	.uleb128 0x6
	.byte	0x8
	.long	0x66
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF51
	.uleb128 0x2
	.long	.LASF52
	.byte	0x9
	.byte	0x63
	.long	0x8a
	.uleb128 0xa
	.long	.LASF53
	.byte	0x10
	.byte	0xa
	.byte	0x1f
	.long	0x364
	.uleb128 0xb
	.long	.LASF54
	.byte	0xa
	.byte	0x21
	.long	0x95
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.long	.LASF55
	.byte	0xa
	.byte	0x22
	.long	0xa0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF56
	.uleb128 0x2
	.long	.LASF57
	.byte	0xb
	.byte	0x38
	.long	0x3c
	.uleb128 0x2
	.long	.LASF58
	.byte	0xc
	.byte	0x1a
	.long	0x51
	.uleb128 0x2
	.long	.LASF59
	.byte	0xc
	.byte	0x1e
	.long	0x364
	.uleb128 0xf
	.long	.LASF67
	.byte	0x4
	.byte	0xd
	.byte	0x1c
	.long	0x3c3
	.uleb128 0x10
	.long	.LASF60
	.sleb128 0
	.uleb128 0x10
	.long	.LASF61
	.sleb128 1
	.uleb128 0x10
	.long	.LASF62
	.sleb128 2
	.uleb128 0x10
	.long	.LASF63
	.sleb128 3
	.uleb128 0x10
	.long	.LASF64
	.sleb128 4
	.uleb128 0x10
	.long	.LASF65
	.sleb128 5
	.uleb128 0x10
	.long	.LASF66
	.sleb128 6
	.byte	0
	.uleb128 0xf
	.long	.LASF68
	.byte	0x4
	.byte	0xd
	.byte	0x2c
	.long	0x40c
	.uleb128 0x10
	.long	.LASF69
	.sleb128 0
	.uleb128 0x10
	.long	.LASF70
	.sleb128 1
	.uleb128 0x10
	.long	.LASF71
	.sleb128 2
	.uleb128 0x10
	.long	.LASF72
	.sleb128 3
	.uleb128 0x10
	.long	.LASF73
	.sleb128 4
	.uleb128 0x10
	.long	.LASF74
	.sleb128 5
	.uleb128 0x10
	.long	.LASF75
	.sleb128 6
	.uleb128 0x10
	.long	.LASF76
	.sleb128 7
	.uleb128 0x10
	.long	.LASF77
	.sleb128 8
	.uleb128 0x10
	.long	.LASF78
	.sleb128 9
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.byte	0xd
	.byte	0xba
	.long	0x42b
	.uleb128 0x12
	.long	.LASF79
	.byte	0xd
	.byte	0xbb
	.long	0x381
	.uleb128 0x12
	.long	.LASF80
	.byte	0xd
	.byte	0xbc
	.long	0x381
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.byte	0xd
	.byte	0xe4
	.long	0x44a
	.uleb128 0x12
	.long	.LASF81
	.byte	0xd
	.byte	0xe5
	.long	0x376
	.uleb128 0x12
	.long	.LASF82
	.byte	0xd
	.byte	0xe6
	.long	0x376
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.byte	0xd
	.byte	0xea
	.long	0x469
	.uleb128 0x12
	.long	.LASF83
	.byte	0xd
	.byte	0xeb
	.long	0x381
	.uleb128 0x12
	.long	.LASF84
	.byte	0xd
	.byte	0xec
	.long	0x381
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.byte	0xd
	.byte	0xee
	.long	0x488
	.uleb128 0x12
	.long	.LASF85
	.byte	0xd
	.byte	0xef
	.long	0x381
	.uleb128 0x12
	.long	.LASF86
	.byte	0xd
	.byte	0xf0
	.long	0x381
	.byte	0
	.uleb128 0xa
	.long	.LASF87
	.byte	0x48
	.byte	0xd
	.byte	0xa9
	.long	0x66e
	.uleb128 0xb
	.long	.LASF88
	.byte	0xd
	.byte	0xae
	.long	0x376
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.long	.LASF89
	.byte	0xd
	.byte	0xb3
	.long	0x376
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF90
	.byte	0xd
	.byte	0xb8
	.long	0x381
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x13
	.long	0x40c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF91
	.byte	0xd
	.byte	0xbf
	.long	0x381
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xb
	.long	.LASF92
	.byte	0xd
	.byte	0xc0
	.long	0x381
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x14
	.long	.LASF93
	.byte	0xd
	.byte	0xc2
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x3f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF94
	.byte	0xd
	.byte	0xc3
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x3e
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF95
	.byte	0xd
	.byte	0xc4
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x3d
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF96
	.byte	0xd
	.byte	0xc5
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x3c
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF97
	.byte	0xd
	.byte	0xc6
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF98
	.byte	0xd
	.byte	0xc7
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x3a
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF99
	.byte	0xd
	.byte	0xc8
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x39
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF100
	.byte	0xd
	.byte	0xc9
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF101
	.byte	0xd
	.byte	0xca
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF102
	.byte	0xd
	.byte	0xcb
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x36
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF103
	.byte	0xd
	.byte	0xcc
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x35
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF104
	.byte	0xd
	.byte	0xcd
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x34
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF105
	.byte	0xd
	.byte	0xce
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF106
	.byte	0xd
	.byte	0xcf
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x32
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF107
	.byte	0xd
	.byte	0xd0
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x31
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF108
	.byte	0xd
	.byte	0xdb
	.long	0x381
	.byte	0x8
	.byte	0x2
	.byte	0x2f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF109
	.byte	0xd
	.byte	0xdc
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x2e
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF110
	.byte	0xd
	.byte	0xdd
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x2d
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF111
	.byte	0xd
	.byte	0xdf
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF112
	.byte	0xd
	.byte	0xe0
	.long	0x381
	.byte	0x8
	.byte	0x1
	.byte	0x2b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.long	.LASF113
	.byte	0xd
	.byte	0xe2
	.long	0x381
	.byte	0x8
	.byte	0x2b
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x13
	.long	0x42b
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xb
	.long	.LASF114
	.byte	0xd
	.byte	0xe9
	.long	0x376
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x13
	.long	0x44a
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x13
	.long	0x469
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF121
	.byte	0x2
	.byte	0x67
	.byte	0x1
	.long	0x66
	.byte	0x3
	.byte	0x1
	.long	0x68e
	.uleb128 0x16
	.long	.LASF115
	.byte	0x2
	.byte	0x67
	.long	0x30d
	.uleb128 0x17
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF118
	.byte	0x1
	.byte	0xf4
	.byte	0x1
	.long	0x6b6
	.byte	0x1
	.long	0x6b6
	.uleb128 0x16
	.long	.LASF116
	.byte	0x1
	.byte	0xf4
	.long	0x6b6
	.uleb128 0x19
	.string	"tp"
	.byte	0x1
	.byte	0xf5
	.long	0x33b
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF117
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF119
	.byte	0x3
	.value	0x117
	.byte	0x1
	.long	0x6b6
	.byte	0x3
	.long	0x6dd
	.uleb128 0x1b
	.long	.LASF120
	.byte	0x3
	.value	0x117
	.long	0x30d
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF122
	.byte	0x4
	.byte	0x23
	.byte	0x1
	.long	0x318
	.byte	0x3
	.byte	0x1
	.long	0x712
	.uleb128 0x16
	.long	.LASF123
	.byte	0x4
	.byte	0x23
	.long	0x66
	.uleb128 0x16
	.long	.LASF124
	.byte	0x4
	.byte	0x23
	.long	0xab
	.uleb128 0x16
	.long	.LASF125
	.byte	0x4
	.byte	0x23
	.long	0x31
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF126
	.byte	0x2
	.byte	0x60
	.byte	0x1
	.long	0x66
	.byte	0x3
	.byte	0x1
	.long	0x73d
	.uleb128 0x16
	.long	.LASF127
	.byte	0x2
	.byte	0x60
	.long	0x73d
	.uleb128 0x16
	.long	.LASF115
	.byte	0x2
	.byte	0x60
	.long	0x30d
	.uleb128 0x17
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xc5
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF129
	.byte	0x1
	.byte	0x25
	.byte	0x1
	.long	0x66
	.quad	.LFB89
	.quad	.LFE89
	.long	.LLST0
	.long	0x7b3
	.uleb128 0x1d
	.string	"hw"
	.byte	0x1
	.byte	0x25
	.long	0x7b3
	.long	.LLST1
	.uleb128 0x1d
	.string	"pid"
	.byte	0x1
	.byte	0x26
	.long	0x330
	.long	.LLST2
	.uleb128 0x1d
	.string	"cpu"
	.byte	0x1
	.byte	0x26
	.long	0x66
	.long	.LLST3
	.uleb128 0x1d
	.string	"grp"
	.byte	0x1
	.byte	0x26
	.long	0x66
	.long	.LLST4
	.uleb128 0x1e
	.long	.LASF128
	.byte	0x1
	.byte	0x26
	.long	0x3c
	.long	.LLST5
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x488
	.uleb128 0x1f
	.long	0x68e
	.quad	.LFB91
	.quad	.LFE91
	.long	.LLST6
	.long	0x844
	.uleb128 0x20
	.long	0x6a0
	.long	.LLST7
	.uleb128 0x21
	.long	0x6ab
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.long	0x68e
	.quad	.LBB62
	.quad	.LBE62
	.byte	0x1
	.byte	0xf4
	.uleb128 0x23
	.quad	.LBB63
	.quad	.LBE63
	.uleb128 0x24
	.long	0x6ab
	.uleb128 0x25
	.long	0x6a0
	.uleb128 0x22
	.long	0x66e
	.quad	.LBB64
	.quad	.LBE64
	.byte	0x1
	.byte	0xfa
	.uleb128 0x26
	.long	0x681
	.byte	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF130
	.byte	0x1
	.value	0x105
	.byte	0x1
	.long	0xb8
	.quad	.LFB92
	.quad	.LFE92
	.long	.LLST8
	.long	0x8a7
	.uleb128 0x28
	.long	.LASF131
	.byte	0x1
	.value	0x105
	.long	0x6b6
	.long	.LLST9
	.uleb128 0x28
	.long	.LASF132
	.byte	0x1
	.value	0x105
	.long	0xb8
	.long	.LLST10
	.uleb128 0x29
	.string	"i"
	.byte	0x1
	.value	0x106
	.long	0x66
	.long	.LLST11
	.uleb128 0x29
	.string	"r"
	.byte	0x1
	.value	0x107
	.long	0x6b6
	.long	.LLST12
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF133
	.byte	0x1
	.value	0x11c
	.byte	0x1
	.long	0x66
	.quad	.LFB93
	.quad	.LFE93
	.long	.LLST13
	.long	0x908
	.uleb128 0x2a
	.string	"off"
	.byte	0x1
	.value	0x11c
	.long	0x323
	.long	.LLST14
	.uleb128 0x29
	.string	"i"
	.byte	0x1
	.value	0x11d
	.long	0x66
	.long	.LLST15
	.uleb128 0x23
	.quad	.LBB66
	.quad	.LBE66
	.uleb128 0x2b
	.string	"r"
	.byte	0x1
	.value	0x11f
	.long	0x6b6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF134
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x66
	.quad	.LFB90
	.quad	.LFE90
	.long	.LLST16
	.long	0xe52
	.uleb128 0x1e
	.long	.LASF135
	.byte	0x1
	.byte	0x34
	.long	0x66
	.long	.LLST17
	.uleb128 0x1e
	.long	.LASF136
	.byte	0x1
	.byte	0x34
	.long	0xe52
	.long	.LLST18
	.uleb128 0x2c
	.string	"t1"
	.byte	0x1
	.byte	0x35
	.long	0xe58
	.byte	0x4
	.byte	0x91
	.sleb128 -12112
	.uleb128 0x2c
	.string	"t2"
	.byte	0x1
	.byte	0x35
	.long	0xe58
	.byte	0x4
	.byte	0x91
	.sleb128 -9104
	.uleb128 0x2c
	.string	"t3"
	.byte	0x1
	.byte	0x35
	.long	0xe58
	.byte	0x3
	.byte	0x91
	.sleb128 -6096
	.uleb128 0x2c
	.string	"t4"
	.byte	0x1
	.byte	0x35
	.long	0xe58
	.byte	0x3
	.byte	0x91
	.sleb128 -3088
	.uleb128 0x2c
	.string	"s1"
	.byte	0x1
	.byte	0x36
	.long	0x6b6
	.byte	0x2
	.byte	0x77
	.sleb128 40
	.uleb128 0x2c
	.string	"s2"
	.byte	0x1
	.byte	0x36
	.long	0x6b6
	.byte	0x2
	.byte	0x77
	.sleb128 48
	.uleb128 0x2c
	.string	"s3"
	.byte	0x1
	.byte	0x36
	.long	0x6b6
	.byte	0x2
	.byte	0x77
	.sleb128 56
	.uleb128 0x2c
	.string	"s4"
	.byte	0x1
	.byte	0x36
	.long	0x6b6
	.byte	0x3
	.byte	0x77
	.sleb128 64
	.uleb128 0x2d
	.string	"i"
	.byte	0x1
	.byte	0x37
	.long	0x66
	.long	.LLST19
	.uleb128 0x2d
	.string	"j"
	.byte	0x1
	.byte	0x37
	.long	0x66
	.long	.LLST20
	.uleb128 0x2e
	.long	.LASF137
	.byte	0x1
	.byte	0x39
	.long	0x6b6
	.long	.LLST21
	.uleb128 0x2e
	.long	.LASF138
	.byte	0x1
	.byte	0x39
	.long	0x6b6
	.long	.LLST22
	.uleb128 0x2d
	.string	"fp"
	.byte	0x1
	.byte	0x3a
	.long	0x73d
	.long	.LLST23
	.uleb128 0x2d
	.string	"o1"
	.byte	0x1
	.byte	0x3b
	.long	0x323
	.long	.LLST24
	.uleb128 0x2d
	.string	"o2"
	.byte	0x1
	.byte	0x3b
	.long	0x323
	.long	.LLST25
	.uleb128 0x2d
	.string	"o3"
	.byte	0x1
	.byte	0x3b
	.long	0x323
	.long	.LLST26
	.uleb128 0x2d
	.string	"o4"
	.byte	0x1
	.byte	0x3b
	.long	0x323
	.long	.LLST27
	.uleb128 0x2e
	.long	.LASF139
	.byte	0x1
	.byte	0x3b
	.long	0x323
	.long	.LLST28
	.uleb128 0x2f
	.long	.LASF140
	.byte	0x1
	.byte	0x3d
	.long	0xe69
	.byte	0x4
	.byte	0x91
	.sleb128 -12176
	.uleb128 0x2f
	.long	.LASF141
	.byte	0x1
	.byte	0x3d
	.long	0xe69
	.byte	0x4
	.byte	0x91
	.sleb128 -12144
	.uleb128 0x2d
	.string	"fd"
	.byte	0x1
	.byte	0x3e
	.long	0xe79
	.long	.LLST29
	.uleb128 0x2d
	.string	"rc"
	.byte	0x1
	.byte	0x3e
	.long	0x66
	.long	.LLST30
	.uleb128 0x2e
	.long	.LASF142
	.byte	0x1
	.byte	0x74
	.long	0x51
	.long	.LLST31
	.uleb128 0x30
	.long	.LASF143
	.long	0xe99
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4766
	.uleb128 0x31
	.long	0x6bd
	.quad	.LBB67
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x67
	.long	0xac7
	.uleb128 0x20
	.long	0x6d0
	.long	.LLST32
	.byte	0
	.uleb128 0x31
	.long	0x6bd
	.quad	.LBB70
	.long	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x68
	.long	0xae8
	.uleb128 0x20
	.long	0x6d0
	.long	.LLST33
	.byte	0
	.uleb128 0x31
	.long	0x6bd
	.quad	.LBB76
	.long	.Ldebug_ranges0+0x70
	.byte	0x1
	.byte	0x69
	.long	0xb09
	.uleb128 0x20
	.long	0x6d0
	.long	.LLST34
	.byte	0
	.uleb128 0x31
	.long	0x6bd
	.quad	.LBB82
	.long	.Ldebug_ranges0+0xb0
	.byte	0x1
	.byte	0x6a
	.long	0xb2a
	.uleb128 0x20
	.long	0x6d0
	.long	.LLST35
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB89
	.quad	.LBE89
	.byte	0x1
	.byte	0x8a
	.long	0xb61
	.uleb128 0x20
	.long	0x706
	.long	.LLST36
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST37
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST38
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB91
	.quad	.LBE91
	.byte	0x1
	.byte	0x8b
	.long	0xb98
	.uleb128 0x20
	.long	0x706
	.long	.LLST39
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST40
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST41
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB93
	.quad	.LBE93
	.byte	0x1
	.byte	0x8c
	.long	0xbcf
	.uleb128 0x20
	.long	0x706
	.long	.LLST42
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST43
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST44
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB95
	.quad	.LBE95
	.byte	0x1
	.byte	0x8d
	.long	0xc06
	.uleb128 0x20
	.long	0x706
	.long	.LLST45
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST46
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST47
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB97
	.quad	.LBE97
	.byte	0x1
	.byte	0xc1
	.long	0xc3d
	.uleb128 0x20
	.long	0x706
	.long	.LLST48
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST49
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST50
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB99
	.quad	.LBE99
	.byte	0x1
	.byte	0xc2
	.long	0xc74
	.uleb128 0x20
	.long	0x706
	.long	.LLST51
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST52
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST53
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB101
	.quad	.LBE101
	.byte	0x1
	.byte	0xc3
	.long	0xcab
	.uleb128 0x20
	.long	0x706
	.long	.LLST54
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST55
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST56
	.byte	0
	.uleb128 0x32
	.long	0x6dd
	.quad	.LBB103
	.quad	.LBE103
	.byte	0x1
	.byte	0xc4
	.long	0xce2
	.uleb128 0x20
	.long	0x706
	.long	.LLST57
	.uleb128 0x20
	.long	0x6fb
	.long	.LLST58
	.uleb128 0x20
	.long	0x6f0
	.long	.LLST59
	.byte	0
	.uleb128 0x32
	.long	0x66e
	.quad	.LBB105
	.quad	.LBE105
	.byte	0x1
	.byte	0xd1
	.long	0xd07
	.uleb128 0x20
	.long	0x681
	.long	.LLST60
	.byte	0
	.uleb128 0x32
	.long	0x66e
	.quad	.LBB107
	.quad	.LBE107
	.byte	0x1
	.byte	0xd2
	.long	0xd2c
	.uleb128 0x20
	.long	0x681
	.long	.LLST61
	.byte	0
	.uleb128 0x32
	.long	0x66e
	.quad	.LBB109
	.quad	.LBE109
	.byte	0x1
	.byte	0xd3
	.long	0xd51
	.uleb128 0x20
	.long	0x681
	.long	.LLST62
	.byte	0
	.uleb128 0x32
	.long	0x66e
	.quad	.LBB111
	.quad	.LBE111
	.byte	0x1
	.byte	0xd4
	.long	0xd76
	.uleb128 0x20
	.long	0x681
	.long	.LLST63
	.byte	0
	.uleb128 0x32
	.long	0x66e
	.quad	.LBB113
	.quad	.LBE113
	.byte	0x1
	.byte	0xd5
	.long	0xd9b
	.uleb128 0x20
	.long	0x681
	.long	.LLST64
	.byte	0
	.uleb128 0x32
	.long	0x66e
	.quad	.LBB115
	.quad	.LBE115
	.byte	0x1
	.byte	0xd6
	.long	0xdc0
	.uleb128 0x20
	.long	0x681
	.long	.LLST65
	.byte	0
	.uleb128 0x32
	.long	0x66e
	.quad	.LBB117
	.quad	.LBE117
	.byte	0x1
	.byte	0xd7
	.long	0xde5
	.uleb128 0x20
	.long	0x681
	.long	.LLST66
	.byte	0
	.uleb128 0x31
	.long	0x66e
	.quad	.LBB119
	.long	.Ldebug_ranges0+0xf0
	.byte	0x1
	.byte	0xd9
	.long	0xe06
	.uleb128 0x20
	.long	0x681
	.long	.LLST67
	.byte	0
	.uleb128 0x31
	.long	0x66e
	.quad	.LBB123
	.long	.Ldebug_ranges0+0x120
	.byte	0x1
	.byte	0xda
	.long	0xe27
	.uleb128 0x20
	.long	0x681
	.long	.LLST68
	.byte	0
	.uleb128 0x22
	.long	0x712
	.quad	.LBB127
	.quad	.LBE127
	.byte	0x1
	.byte	0xe0
	.uleb128 0x20
	.long	0x730
	.long	.LLST69
	.uleb128 0x20
	.long	0x725
	.long	.LLST70
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb8
	.uleb128 0xc
	.long	0xbe
	.long	0xe69
	.uleb128 0x33
	.long	0x3c
	.value	0xbb8
	.byte	0
	.uleb128 0xc
	.long	0x36b
	.long	0xe79
	.uleb128 0xd
	.long	0x3c
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	0x66
	.long	0xe89
	.uleb128 0xd
	.long	0x3c
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	0xbe
	.long	0xe99
	.uleb128 0xd
	.long	0x3c
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.long	0xe89
	.uleb128 0x34
	.long	.LASF144
	.byte	0x7
	.byte	0xa9
	.long	0x2e1
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.long	.LASF145
	.byte	0x7
	.byte	0xaa
	.long	0x2e1
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x488
	.long	0xec8
	.uleb128 0xd
	.long	0x3c
	.byte	0x3
	.byte	0
	.uleb128 0x35
	.long	.LASF146
	.byte	0x1
	.byte	0x31
	.long	0xeb8
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	attr
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LFB89
	.quad	.LCFI0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI0
	.quad	.LCFI1
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI1
	.quad	.LFE89
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL5
	.value	0x1
	.byte	0x55
	.quad	.LVL5
	.quad	.LVL6-1
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0
	.quad	.LVL4
	.value	0x1
	.byte	0x54
	.quad	.LVL4
	.quad	.LVL6-1
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL0
	.quad	.LVL3
	.value	0x1
	.byte	0x51
	.quad	.LVL3
	.quad	.LVL6-1
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x52
	.quad	.LVL2
	.quad	.LVL6-1
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x58
	.quad	.LVL1
	.quad	.LVL6-1
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST6:
	.quad	.LFB91
	.quad	.LCFI2
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI2
	.quad	.LCFI3
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI3
	.quad	.LCFI4
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI4
	.quad	.LCFI5
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI5
	.quad	.LFE91
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL7
	.quad	.LVL8-1
	.value	0x1
	.byte	0x61
	.quad	.LVL8-1
	.quad	.LFE91
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.quad	0
	.quad	0
.LLST8:
	.quad	.LFB92
	.quad	.LCFI6
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI6
	.quad	.LCFI7
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI7
	.quad	.LCFI8
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI8
	.quad	.LCFI9
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI9
	.quad	.LCFI10
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI10
	.quad	.LCFI11
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI11
	.quad	.LCFI12
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI12
	.quad	.LCFI13
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI13
	.quad	.LFE92
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL10
	.quad	.LVL11
	.value	0x1
	.byte	0x61
	.quad	.LVL11
	.quad	.LFE92
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL10
	.quad	.LVL11
	.value	0x1
	.byte	0x55
	.quad	.LVL11
	.quad	.LVL15
	.value	0x1
	.byte	0x53
	.quad	.LVL15
	.quad	.LFE92
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL10
	.quad	.LVL11
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL14
	.quad	.LFE92
	.value	0x1
	.byte	0x62
	.quad	0
	.quad	0
.LLST13:
	.quad	.LFB93
	.quad	.LCFI14
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI14
	.quad	.LCFI15
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI15
	.quad	.LCFI16
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI16
	.quad	.LCFI17
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI17
	.quad	.LCFI18
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI18
	.quad	.LCFI19
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI19
	.quad	.LFE93
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL16
	.quad	.LVL17
	.value	0x1
	.byte	0x55
	.quad	.LVL17
	.quad	.LVL20
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL16
	.quad	.LVL17
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LFB90
	.quad	.LCFI20
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI20
	.quad	.LCFI21
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI21
	.quad	.LCFI22
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI22
	.quad	.LCFI23
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI23
	.quad	.LCFI24
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI24
	.quad	.LCFI25
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI25
	.quad	.LCFI26
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI26
	.quad	.LCFI27
	.value	0x4
	.byte	0x77
	.sleb128 12256
	.quad	.LCFI27
	.quad	.LCFI28
	.value	0x2
	.byte	0x77
	.sleb128 56
	.quad	.LCFI28
	.quad	.LCFI29
	.value	0x2
	.byte	0x77
	.sleb128 48
	.quad	.LCFI29
	.quad	.LCFI30
	.value	0x2
	.byte	0x77
	.sleb128 40
	.quad	.LCFI30
	.quad	.LCFI31
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LCFI31
	.quad	.LCFI32
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LCFI32
	.quad	.LCFI33
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI33
	.quad	.LCFI34
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI34
	.quad	.LFE90
	.value	0x4
	.byte	0x77
	.sleb128 12256
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL21
	.quad	.LVL23-1
	.value	0x1
	.byte	0x55
	.quad	.LVL23-1
	.quad	.LVL42
	.value	0x1
	.byte	0x56
	.quad	.LVL90
	.quad	.LVL97
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL21
	.quad	.LVL23-1
	.value	0x1
	.byte	0x54
	.quad	.LVL23-1
	.quad	.LVL62
	.value	0x1
	.byte	0x53
	.quad	.LVL90
	.quad	.LVL98
	.value	0x1
	.byte	0x53
	.quad	.LVL102
	.quad	.LVL103
	.value	0x1
	.byte	0x53
	.quad	.LVL104
	.quad	.LFE90
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL22
	.quad	.LVL62
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL84
	.quad	.LVL85
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL90
	.quad	.LVL98
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL102
	.quad	.LVL103
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL104
	.quad	.LFE90
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL22
	.quad	.LVL62
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL63
	.quad	.LVL87
	.value	0x1
	.byte	0x53
	.quad	.LVL88
	.quad	.LVL90
	.value	0x1
	.byte	0x53
	.quad	.LVL90
	.quad	.LVL98
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x1
	.byte	0x53
	.quad	.LVL101
	.quad	.LVL102
	.value	0x1
	.byte	0x53
	.quad	.LVL102
	.quad	.LVL103
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL104
	.value	0x1
	.byte	0x53
	.quad	.LVL104
	.quad	.LFE90
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL52
	.quad	.LVL54-1
	.value	0x1
	.byte	0x61
	.quad	.LVL54-1
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12184
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12184
	.quad	.LVL97
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12184
	.quad	.LVL101
	.quad	.LFE90
	.value	0x4
	.byte	0x91
	.sleb128 -12184
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL73
	.quad	.LVL74-1
	.value	0x1
	.byte	0x61
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL84
	.quad	.LVL85
	.value	0x1
	.byte	0x50
	.quad	.LVL85
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL40
	.quad	.LVL41-1
	.value	0x1
	.byte	0x50
	.quad	.LVL41-1
	.quad	.LVL87
	.value	0x1
	.byte	0x5c
	.quad	.LVL88
	.quad	.LVL90
	.value	0x1
	.byte	0x5c
	.quad	.LVL97
	.quad	.LVL100
	.value	0x1
	.byte	0x5c
	.quad	.LVL101
	.quad	.LFE90
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL42
	.quad	.LVL43-1
	.value	0x1
	.byte	0x50
	.quad	.LVL43-1
	.quad	.LVL87
	.value	0x1
	.byte	0x56
	.quad	.LVL88
	.quad	.LVL90
	.value	0x1
	.byte	0x56
	.quad	.LVL97
	.quad	.LVL100
	.value	0x1
	.byte	0x56
	.quad	.LVL101
	.quad	.LFE90
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL44
	.quad	.LVL45-1
	.value	0x1
	.byte	0x50
	.quad	.LVL45-1
	.quad	.LVL87
	.value	0x1
	.byte	0x5e
	.quad	.LVL88
	.quad	.LVL90
	.value	0x1
	.byte	0x5e
	.quad	.LVL97
	.quad	.LVL100
	.value	0x1
	.byte	0x5e
	.quad	.LVL101
	.quad	.LFE90
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL46
	.quad	.LVL47-1
	.value	0x1
	.byte	0x50
	.quad	.LVL47-1
	.quad	.LVL87
	.value	0x1
	.byte	0x5f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x1
	.byte	0x5f
	.quad	.LVL97
	.quad	.LVL100
	.value	0x1
	.byte	0x5f
	.quad	.LVL101
	.quad	.LFE90
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL48
	.quad	.LVL49-1
	.value	0x1
	.byte	0x50
	.quad	.LVL49-1
	.quad	.LVL87
	.value	0x1
	.byte	0x5d
	.quad	.LVL88
	.quad	.LVL90
	.value	0x1
	.byte	0x5d
	.quad	.LVL97
	.quad	.LVL100
	.value	0x1
	.byte	0x5d
	.quad	.LVL101
	.quad	.LFE90
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL24
	.quad	.LVL25
	.value	0x5
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0xc
	.quad	.LVL25
	.quad	.LVL26
	.value	0x8
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0xc
	.quad	.LVL26
	.quad	.LVL27
	.value	0xb
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL27
	.quad	.LVL28
	.value	0xe
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL28
	.quad	.LVL29
	.value	0x11
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL29
	.quad	.LVL30
	.value	0x14
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12224
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL30
	.quad	.LVL31
	.value	0x15
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12224
	.byte	0x93
	.uleb128 0x4
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL31
	.quad	.LVL90
	.value	0x18
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12224
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12220
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL90
	.quad	.LVL91
	.value	0xe
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x8
	.quad	.LVL91
	.quad	.LVL92-1
	.value	0x15
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12224
	.byte	0x93
	.uleb128 0x4
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL92-1
	.quad	.LVL93
	.value	0x18
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12224
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12220
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL93
	.quad	.LVL94
	.value	0x8
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0xc
	.quad	.LVL94
	.quad	.LVL95-1
	.value	0x11
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL95-1
	.quad	.LVL96
	.value	0x14
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12224
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.quad	.LVL96
	.quad	.LFE90
	.value	0x18
	.byte	0x91
	.sleb128 -12240
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12228
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12224
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12220
	.byte	0x93
	.uleb128 0x4
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL54
	.quad	.LVL56-1
	.value	0x1
	.byte	0x50
	.quad	.LVL56
	.quad	.LVL58-1
	.value	0x1
	.byte	0x50
	.quad	.LVL58
	.quad	.LVL60-1
	.value	0x1
	.byte	0x50
	.quad	.LVL60
	.quad	.LVL61
	.value	0x1
	.byte	0x50
	.quad	.LVL65
	.quad	.LVL67-1
	.value	0x1
	.byte	0x50
	.quad	.LVL67
	.quad	.LVL69-1
	.value	0x1
	.byte	0x50
	.quad	.LVL69
	.quad	.LVL71-1
	.value	0x1
	.byte	0x50
	.quad	.LVL71
	.quad	.LVL72-1
	.value	0x1
	.byte	0x50
	.quad	.LVL97
	.quad	.LVL98-1
	.value	0x1
	.byte	0x50
	.quad	.LVL98
	.quad	.LVL99-1
	.value	0x1
	.byte	0x50
	.quad	.LVL99
	.quad	.LVL100-1
	.value	0x1
	.byte	0x50
	.quad	.LVL101
	.quad	.LVL102-1
	.value	0x1
	.byte	0x50
	.quad	.LVL102
	.quad	.LVL103-1
	.value	0x1
	.byte	0x50
	.quad	.LVL103
	.quad	.LVL104-1
	.value	0x1
	.byte	0x50
	.quad	.LVL104
	.quad	.LVL105-1
	.value	0x1
	.byte	0x50
	.quad	.LVL105
	.quad	.LVL106-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL49
	.quad	.LVL50-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL32
	.quad	.LVL33-1
	.value	0x2
	.byte	0x73
	.sleb128 8
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL34
	.quad	.LVL35-1
	.value	0x2
	.byte	0x73
	.sleb128 16
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL36
	.quad	.LVL37-1
	.value	0x2
	.byte	0x73
	.sleb128 24
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL38
	.quad	.LVL39-1
	.value	0x2
	.byte	0x73
	.sleb128 32
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL53
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL97
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL101
	.quad	.LFE90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL53
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12176
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12176
	.byte	0x9f
	.quad	.LVL97
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12176
	.byte	0x9f
	.quad	.LVL101
	.quad	.LFE90
	.value	0x5
	.byte	0x91
	.sleb128 -12176
	.byte	0x9f
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL53
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	.LVL97
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	.LVL101
	.quad	.LFE90
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL55
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL97
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL103
	.quad	.LFE90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL55
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12168
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12168
	.byte	0x9f
	.quad	.LVL97
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12168
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x5
	.byte	0x91
	.sleb128 -12168
	.byte	0x9f
	.quad	.LVL103
	.quad	.LFE90
	.value	0x5
	.byte	0x91
	.sleb128 -12168
	.byte	0x9f
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL55
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	.LVL97
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	.LVL101
	.quad	.LVL102
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	.LVL103
	.quad	.LFE90
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL57
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL103
	.quad	.LFE90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL57
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12160
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12160
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12160
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x5
	.byte	0x91
	.sleb128 -12160
	.byte	0x9f
	.quad	.LVL103
	.quad	.LFE90
	.value	0x5
	.byte	0x91
	.sleb128 -12160
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL57
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	.LVL98
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	.LVL101
	.quad	.LVL102
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	.LVL103
	.quad	.LFE90
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL59
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL105
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL59
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12152
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12152
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12152
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x5
	.byte	0x91
	.sleb128 -12152
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL105
	.value	0x5
	.byte	0x91
	.sleb128 -12152
	.byte	0x9f
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL59
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	.LVL98
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	.LVL101
	.quad	.LVL102
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	.LVL103
	.quad	.LVL105
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL64
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL104
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL64
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12144
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12144
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12144
	.byte	0x9f
	.quad	.LVL101
	.quad	.LVL102
	.value	0x5
	.byte	0x91
	.sleb128 -12144
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL104
	.value	0x5
	.byte	0x91
	.sleb128 -12144
	.byte	0x9f
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL64
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	.LVL98
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	.LVL101
	.quad	.LVL102
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	.LVL103
	.quad	.LVL104
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL66
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL104
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL66
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12136
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12136
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12136
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL104
	.value	0x5
	.byte	0x91
	.sleb128 -12136
	.byte	0x9f
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL66
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	.LVL98
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	.LVL103
	.quad	.LVL104
	.value	0x4
	.byte	0x91
	.sleb128 -12228
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL68
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL99
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL104
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL68
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12128
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12128
	.byte	0x9f
	.quad	.LVL99
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12128
	.byte	0x9f
	.quad	.LVL103
	.quad	.LVL104
	.value	0x5
	.byte	0x91
	.sleb128 -12128
	.byte	0x9f
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL68
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	.LVL99
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	.LVL103
	.quad	.LVL104
	.value	0x4
	.byte	0x91
	.sleb128 -12224
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL70
	.quad	.LVL87
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL99
	.quad	.LVL100
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL70
	.quad	.LVL87
	.value	0x5
	.byte	0x91
	.sleb128 -12120
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0x5
	.byte	0x91
	.sleb128 -12120
	.byte	0x9f
	.quad	.LVL99
	.quad	.LVL100
	.value	0x5
	.byte	0x91
	.sleb128 -12120
	.byte	0x9f
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL70
	.quad	.LVL87
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	.LVL88
	.quad	.LVL90
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	.LVL99
	.quad	.LVL100
	.value	0x4
	.byte	0x91
	.sleb128 -12220
	.quad	0
	.quad	0
.LLST60:
	.quad	.LVL74
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC12
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0xa
	.byte	0x3
	.quad	.LC12
	.byte	0x9f
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL75
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC13
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0xa
	.byte	0x3
	.quad	.LC13
	.byte	0x9f
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL76
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC14
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0xa
	.byte	0x3
	.quad	.LC14
	.byte	0x9f
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL77
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC15
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL90
	.value	0xa
	.byte	0x3
	.quad	.LC15
	.byte	0x9f
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL78
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC16
	.byte	0x9f
	.quad	.LVL89
	.quad	.LVL90
	.value	0xa
	.byte	0x3
	.quad	.LC16
	.byte	0x9f
	.quad	0
	.quad	0
.LLST65:
	.quad	.LVL79
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC17
	.byte	0x9f
	.quad	.LVL89
	.quad	.LVL90
	.value	0xa
	.byte	0x3
	.quad	.LC17
	.byte	0x9f
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL80
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC19
	.byte	0x9f
	.quad	.LVL89
	.quad	.LVL90
	.value	0xa
	.byte	0x3
	.quad	.LC19
	.byte	0x9f
	.quad	0
	.quad	0
.LLST67:
	.quad	.LVL82
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC21
	.byte	0x9f
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL83
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL85
	.quad	.LVL86
	.value	0xa
	.byte	0x3
	.quad	.LC25
	.byte	0x9f
	.quad	0
	.quad	0
.LLST70:
	.quad	.LVL85
	.quad	.LVL86
	.value	0x4
	.byte	0x91
	.sleb128 -12240
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB90
	.quad	.LFE90-.LFB90
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB67
	.quad	.LBE67
	.quad	.LBB74
	.quad	.LBE74
	.quad	0
	.quad	0
	.quad	.LBB70
	.quad	.LBE70
	.quad	.LBB75
	.quad	.LBE75
	.quad	.LBB80
	.quad	.LBE80
	.quad	0
	.quad	0
	.quad	.LBB76
	.quad	.LBE76
	.quad	.LBB81
	.quad	.LBE81
	.quad	.LBB86
	.quad	.LBE86
	.quad	0
	.quad	0
	.quad	.LBB82
	.quad	.LBE82
	.quad	.LBB87
	.quad	.LBE87
	.quad	.LBB88
	.quad	.LBE88
	.quad	0
	.quad	0
	.quad	.LBB119
	.quad	.LBE119
	.quad	.LBB122
	.quad	.LBE122
	.quad	0
	.quad	0
	.quad	.LBB123
	.quad	.LBE123
	.quad	.LBB126
	.quad	.LBE126
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB90
	.quad	.LFE90
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF121:
	.string	"printf"
.LASF17:
	.string	"_IO_read_ptr"
.LASF142:
	.string	"iseed"
.LASF29:
	.string	"_chain"
.LASF109:
	.string	"mmap_data"
.LASF7:
	.string	"size_t"
.LASF82:
	.string	"wakeup_watermark"
.LASF35:
	.string	"_shortbuf"
.LASF96:
	.string	"exclusive"
.LASF50:
	.string	"ssize_t"
.LASF102:
	.string	"comm"
.LASF88:
	.string	"type"
.LASF77:
	.string	"PERF_COUNT_HW_STALLED_CYCLES_BACKEND"
.LASF23:
	.string	"_IO_buf_base"
.LASF92:
	.string	"read_format"
.LASF107:
	.string	"watermark"
.LASF72:
	.string	"PERF_COUNT_HW_CACHE_MISSES"
.LASF56:
	.string	"long long unsigned int"
.LASF80:
	.string	"sample_freq"
.LASF78:
	.string	"PERF_COUNT_HW_MAX"
.LASF73:
	.string	"PERF_COUNT_HW_BRANCH_INSTRUCTIONS"
.LASF100:
	.string	"exclude_idle"
.LASF4:
	.string	"signed char"
.LASF103:
	.string	"freq"
.LASF143:
	.string	"__PRETTY_FUNCTION__"
.LASF131:
	.string	"selectivity"
.LASF30:
	.string	"_fileno"
.LASF81:
	.string	"wakeup_events"
.LASF18:
	.string	"_IO_read_end"
.LASF150:
	.string	"_IO_lock_t"
.LASF97:
	.string	"exclude_user"
.LASF6:
	.string	"long int"
.LASF16:
	.string	"_flags"
.LASF63:
	.string	"PERF_TYPE_HW_CACHE"
.LASF13:
	.string	"__ssize_t"
.LASF149:
	.string	"/home/qc2195/zixuan/dbi/template"
.LASF24:
	.string	"_IO_buf_end"
.LASF33:
	.string	"_cur_column"
.LASF91:
	.string	"sample_type"
.LASF101:
	.string	"mmap"
.LASF117:
	.string	"double"
.LASF67:
	.string	"perf_type_id"
.LASF62:
	.string	"PERF_TYPE_TRACEPOINT"
.LASF37:
	.string	"_offset"
.LASF129:
	.string	"perf_event_open"
.LASF70:
	.string	"PERF_COUNT_HW_INSTRUCTIONS"
.LASF38:
	.string	"__pad1"
.LASF47:
	.string	"_next"
.LASF66:
	.string	"PERF_TYPE_MAX"
.LASF125:
	.string	"__nbytes"
.LASF51:
	.string	"long long int"
.LASF146:
	.string	"attr"
.LASF46:
	.string	"_IO_marker"
.LASF144:
	.string	"stdin"
.LASF113:
	.string	"__reserved_1"
.LASF3:
	.string	"unsigned int"
.LASF85:
	.string	"bp_len"
.LASF126:
	.string	"fprintf"
.LASF93:
	.string	"disabled"
.LASF94:
	.string	"inherit"
.LASF127:
	.string	"__stream"
.LASF0:
	.string	"long unsigned int"
.LASF58:
	.string	"__u32"
.LASF12:
	.string	"__suseconds_t"
.LASF21:
	.string	"_IO_write_ptr"
.LASF60:
	.string	"PERF_TYPE_HARDWARE"
.LASF99:
	.string	"exclude_hv"
.LASF48:
	.string	"_sbuf"
.LASF132:
	.string	"data"
.LASF89:
	.string	"size"
.LASF2:
	.string	"short unsigned int"
.LASF64:
	.string	"PERF_TYPE_RAW"
.LASF25:
	.string	"_IO_save_base"
.LASF36:
	.string	"_lock"
.LASF114:
	.string	"bp_type"
.LASF31:
	.string	"_flags2"
.LASF53:
	.string	"timeval"
.LASF145:
	.string	"stdout"
.LASF123:
	.string	"__fd"
.LASF116:
	.string	"start_time"
.LASF139:
	.string	"answer"
.LASF54:
	.string	"tv_sec"
.LASF98:
	.string	"exclude_kernel"
.LASF22:
	.string	"_IO_write_end"
.LASF57:
	.string	"uint64_t"
.LASF61:
	.string	"PERF_TYPE_SOFTWARE"
.LASF79:
	.string	"sample_period"
.LASF140:
	.string	"val1"
.LASF141:
	.string	"val2"
.LASF45:
	.string	"_IO_FILE"
.LASF69:
	.string	"PERF_COUNT_HW_CPU_CYCLES"
.LASF124:
	.string	"__buf"
.LASF120:
	.string	"__nptr"
.LASF43:
	.string	"_mode"
.LASF133:
	.string	"createOffsets"
.LASF49:
	.string	"_pos"
.LASF32:
	.string	"_old_offset"
.LASF74:
	.string	"PERF_COUNT_HW_BRANCH_MISSES"
.LASF28:
	.string	"_markers"
.LASF110:
	.string	"sample_id_all"
.LASF119:
	.string	"atof"
.LASF83:
	.string	"bp_addr"
.LASF1:
	.string	"unsigned char"
.LASF71:
	.string	"PERF_COUNT_HW_CACHE_REFERENCES"
.LASF87:
	.string	"perf_event_attr"
.LASF10:
	.string	"__pid_t"
.LASF5:
	.string	"short int"
.LASF34:
	.string	"_vtable_offset"
.LASF15:
	.string	"FILE"
.LASF138:
	.string	"stop"
.LASF112:
	.string	"exclude_guest"
.LASF8:
	.string	"__off_t"
.LASF55:
	.string	"tv_usec"
.LASF130:
	.string	"createData"
.LASF147:
	.string	"GNU C 4.6.3"
.LASF59:
	.string	"__u64"
.LASF14:
	.string	"char"
.LASF90:
	.string	"config"
.LASF76:
	.string	"PERF_COUNT_HW_STALLED_CYCLES_FRONTEND"
.LASF84:
	.string	"config1"
.LASF86:
	.string	"config2"
.LASF68:
	.string	"perf_hw_id"
.LASF95:
	.string	"pinned"
.LASF9:
	.string	"__off64_t"
.LASF106:
	.string	"task"
.LASF19:
	.string	"_IO_read_base"
.LASF27:
	.string	"_IO_save_end"
.LASF115:
	.string	"__fmt"
.LASF118:
	.string	"get_timestamp"
.LASF39:
	.string	"__pad2"
.LASF40:
	.string	"__pad3"
.LASF41:
	.string	"__pad4"
.LASF42:
	.string	"__pad5"
.LASF11:
	.string	"__time_t"
.LASF108:
	.string	"precise_ip"
.LASF44:
	.string	"_unused2"
.LASF136:
	.string	"argv"
.LASF65:
	.string	"PERF_TYPE_BREAKPOINT"
.LASF148:
	.string	"branch_mispred.c"
.LASF26:
	.string	"_IO_backup_base"
.LASF128:
	.string	"flags"
.LASF75:
	.string	"PERF_COUNT_HW_BUS_CYCLES"
.LASF122:
	.string	"read"
.LASF135:
	.string	"argc"
.LASF52:
	.string	"pid_t"
.LASF137:
	.string	"start"
.LASF134:
	.string	"main"
.LASF20:
	.string	"_IO_write_base"
.LASF104:
	.string	"inherit_stat"
.LASF111:
	.string	"exclude_host"
.LASF105:
	.string	"enable_on_exec"
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
