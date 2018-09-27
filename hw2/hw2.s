	.file	"hw2.c"
# GNU C17 (GCC) version 8.2.1 20180831 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 8.2.1 20180831, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed hw2.i -mtune=generic -march=x86-64 -O2
# -Wall -Wextra -fverbose-asm
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-labels -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcode-hoisting -fcombine-stack-adjustments -fcommon
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra -fipa-vrp
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
# -fprefetch-loop-arrays -free -freg-struct-return -freorder-blocks
# -freorder-blocks-and-partition -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns2
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstack-protector-strong
# -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -funwind-tables -fverbose-asm
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.8f\n"
	.text
	.p2align 4,,15
	.globl	printToFile
	.type	printToFile, @function
printToFile:
.LFB22:
	.cfi_startproc
# hw2.c:6: 	if(aFile == NULL){
	testq	%rdi, %rdi	# aFile
	je	.L3	#,
# hw2.c:5: {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# hw2.c:9: 	fprintf(aFile,"%.8f\n",sort_time);
	leaq	.LC0(%rip), %rsi	#,
	movl	$1, %eax	#,
	cvtss2sd	%xmm0, %xmm0	# sort_time, tmp91
	call	fprintf@PLT	#
# hw2.c:10: 	return 0;
	xorl	%eax, %eax	# <retval>
# hw2.c:11: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
	ret	
.L3:
# hw2.c:7: 		return -1;
	movl	$-1, %eax	#, <retval>
# hw2.c:11: }
	ret	
	.cfi_endproc
.LFE22:
	.size	printToFile, .-printToFile
	.p2align 4,,15
	.globl	sort
	.type	sort, @function
sort:
.LFB23:
	.cfi_startproc
# hw2.c:18: 	for(frstCnt = 0;frstCnt < N - 1;frstCnt++){
	cmpl	$1, %esi	#, N
	jle	.L21	#,
# hw2.c:14: {
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r11	# array, ivtmp.19
	leal	-1(%rsi), %r13d	#, _46
# hw2.c:18: 	for(frstCnt = 0;frstCnt < N - 1;frstCnt++){
	xorl	%r10d, %r10d	# minIndex
# hw2.c:14: {
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	.p2align 4,,10
	.p2align 3
.L14:
# hw2.c:20: 	for(scndCnt = frstCnt + 1;scndCnt < N;scndCnt ++){
	leal	1(%r10), %ebx	#, scndCnt
	movl	(%r11), %ebp	# MEM[base: _66, offset: 0B], pretmp_67
# hw2.c:20: 	for(scndCnt = frstCnt + 1;scndCnt < N;scndCnt ++){
	cmpl	%ebx, %esi	# scndCnt, N
	jle	.L16	#,
	leaq	4(%r11), %r12	#, ivtmp.19
	movl	%ebp, %r8d	# pretmp_67, prephitmp_50
	movl	%ebx, %edx	# scndCnt, scndCnt
	movq	%r12, %rax	# ivtmp.19, ivtmp.9
	jmp	.L13	#
	.p2align 4,,10
	.p2align 3
.L24:
# hw2.c:21: 		if(array[scndCnt] < array[minIndex]){
	movslq	%r10d, %rcx	# minIndex, minIndex
# hw2.c:20: 	for(scndCnt = frstCnt + 1;scndCnt < N;scndCnt ++){
	addl	$1, %edx	#, scndCnt
	addq	$4, %rax	#, ivtmp.9
# hw2.c:21: 		if(array[scndCnt] < array[minIndex]){
	leaq	(%rdi,%rcx,4), %r9	#, _3
# hw2.c:20: 	for(scndCnt = frstCnt + 1;scndCnt < N;scndCnt ++){
	cmpl	%edx, %esi	# scndCnt, N
	je	.L11	#,
.L13:
# hw2.c:21: 		if(array[scndCnt] < array[minIndex]){
	movl	(%rax), %ecx	# MEM[base: _3, offset: 0B], _4
	movq	%rax, %r9	# ivtmp.9, _3
# hw2.c:21: 		if(array[scndCnt] < array[minIndex]){
	cmpl	%r8d, %ecx	# prephitmp_50, _4
	jge	.L24	#,
	movl	%edx, %r10d	# scndCnt, minIndex
# hw2.c:20: 	for(scndCnt = frstCnt + 1;scndCnt < N;scndCnt ++){
	addl	$1, %edx	#, scndCnt
	movl	%ecx, %r8d	# _4, prephitmp_50
	addq	$4, %rax	#, ivtmp.9
# hw2.c:20: 	for(scndCnt = frstCnt + 1;scndCnt < N;scndCnt ++){
	cmpl	%edx, %esi	# scndCnt, N
	jne	.L13	#,
.L11:
# hw2.c:26: 	array[frstCnt] = array[minIndex];
	movl	%r8d, (%r11)	# prephitmp_50, MEM[base: _66, offset: 0B]
	movl	%ebx, %r10d	# scndCnt, minIndex
	movq	%r12, %r11	# ivtmp.19, ivtmp.19
# hw2.c:27: 	array[minIndex] = theTmp;
	movl	%ebp, (%r9)	# pretmp_67, *prephitmp_56
# hw2.c:18: 	for(frstCnt = 0;frstCnt < N - 1;frstCnt++){
	cmpl	%r13d, %ebx	# _46, minIndex
	jne	.L14	#,
# hw2.c:29: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
# hw2.c:20: 	for(scndCnt = frstCnt + 1;scndCnt < N;scndCnt ++){
	movl	%ebp, %r8d	# pretmp_67, prephitmp_50
	movq	%r11, %r9	# ivtmp.19, _3
	leaq	4(%r11), %r12	#, ivtmp.19
	jmp	.L11	#
.L21:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret	
	.cfi_endproc
.LFE23:
	.size	sort, .-sort
	.section	.rodata.str1.1
.LC1:
	.string	"a"
.LC2:
	.string	"timings.txt"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Time of sorting in seconds for %i size = %.8f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# hw2.c:33: 	FILE *aFile = fopen("timings.txt","a");
	leaq	.LC1(%rip), %rsi	#,
	leaq	.LC2(%rip), %rdi	#,
# hw2.c:32: {	
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
# hw2.c:38: 	int array[G_SIZE];
	leaq	-60(%rbp), %r14	#, array.1
# hw2.c:32: {	
	pushq	%r13	#
	.cfi_offset 13, -40
# hw2.c:36: 	int G_SIZE = 0;
	xorl	%r13d, %r13d	# G_SIZE
# hw2.c:32: {	
	pushq	%r12	#
	.cfi_offset 12, -48
# hw2.c:40: 	array[j] = rand() % 1000 + 1;
	movl	$274877907, %r12d	#, tmp150
# hw2.c:32: {	
	pushq	%rbx	#
	subq	$104, %rsp	#,
	.cfi_offset 3, -56
# hw2.c:32: {	
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp151
	movq	%rax, -56(%rbp)	# tmp151, D.3153
	xorl	%eax, %eax	# tmp151
# hw2.c:33: 	FILE *aFile = fopen("timings.txt","a");
	call	fopen@PLT	#
# hw2.c:37: 	for(int i = 0;i < 31;i++){
	movq	%rsp, -112(%rbp)	#, %sfp
# hw2.c:33: 	FILE *aFile = fopen("timings.txt","a");
	movq	%rax, -104(%rbp)	#, %sfp
	leaq	-96(%rbp), %rax	#, tmp147
	movq	%rax, -136(%rbp)	# tmp147, %sfp
	leaq	-80(%rbp), %rax	#, tmp148
# hw2.c:37: 	for(int i = 0;i < 31;i++){
	movq	$16000, -128(%rbp)	#, %sfp
	movq	%rax, -144(%rbp)	# tmp148, %sfp
	.p2align 4,,10
	.p2align 3
.L26:
# hw2.c:42: 	clock_gettime (CLOCK_REALTIME, &start);
	movq	-136(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	clock_gettime@PLT	#
# hw2.c:43: 	sort(array,G_SIZE);
	movl	%r13d, %esi	# G_SIZE,
	movq	%r14, %rdi	# array.1,
	call	sort	#
# hw2.c:44: 	clock_gettime (CLOCK_REALTIME, &end);
	movq	-144(%rbp), %rsi	# %sfp,
	xorl	%edi, %edi	#
	call	clock_gettime@PLT	#
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	movq	-72(%rbp), %rax	# end.tv_nsec, end.tv_nsec
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	pxor	%xmm1, %xmm1	# tmp136
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	subq	-88(%rbp), %rax	# start.tv_nsec, tmp134
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	cvtsi2sdq	%rax, %xmm1	# tmp134, tmp136
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	pxor	%xmm0, %xmm0	# tmp141
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	movq	-80(%rbp), %rax	# end.tv_sec, end.tv_sec
	subq	-96(%rbp), %rax	# start.tv_sec, tmp139
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	mulsd	.LC3(%rip), %xmm1	#, tmp137
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	cvtsi2sdq	%rax, %xmm0	# tmp139, tmp141
# hw2.c:6: 	if(aFile == NULL){
	cmpq	$0, -104(%rbp)	#, %sfp
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	addsd	%xmm0, %xmm1	# tmp141, tmp142
# hw2.c:45: 	finalTime = (end.tv_sec - start.tv_sec)+ 0.000000001*(end.tv_nsec - start.tv_nsec);
	cvtsd2ss	%xmm1, %xmm1	# tmp142, finalTime
	cvtss2sd	%xmm1, %xmm1	# finalTime, _43
# hw2.c:6: 	if(aFile == NULL){
	je	.L30	#,
# hw2.c:9: 	fprintf(aFile,"%.8f\n",sort_time);
	movq	-104(%rbp), %rdi	# %sfp,
	movapd	%xmm1, %xmm0	# _43,
	movl	$1, %eax	#,
	leaq	.LC0(%rip), %rsi	#,
	movsd	%xmm1, -120(%rbp)	# _43, %sfp
	call	fprintf@PLT	#
	movsd	-120(%rbp), %xmm1	# %sfp, _43
.L30:
# hw2.c:47: 	printf("Time of sorting in seconds for %i size = %.8f\n",G_SIZE,finalTime);
	movl	%r13d, %esi	# G_SIZE,
	movapd	%xmm1, %xmm0	# _43,
	leaq	.LC4(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# hw2.c:48: 	G_SIZE += 4000;
	addl	$4000, %r13d	#, G_SIZE
	movq	-112(%rbp), %rsp	# %sfp,
# hw2.c:37: 	for(int i = 0;i < 31;i++){
	cmpl	$124000, %r13d	#, G_SIZE
	je	.L36	#,
# hw2.c:38: 	int array[G_SIZE];
	movq	-128(%rbp), %rsi	# %sfp, ivtmp.35
# hw2.c:37: 	for(int i = 0;i < 31;i++){
	movq	%rsp, -112(%rbp)	#, %sfp
# hw2.c:38: 	int array[G_SIZE];
	leaq	15(%rsi), %rax	#, tmp115
	andq	$-16, %rax	#, tmp119
	subq	%rax, %rsp	# tmp119,
	movq	%rsp, %r14	#, array.1
	movq	%r14, %r15	# array.1, ivtmp.25
	leaq	(%r14,%rsi), %rbx	#, _65
	.p2align 4,,10
	.p2align 3
.L27:
# hw2.c:40: 	array[j] = rand() % 1000 + 1;
	call	rand@PLT	#
	addq	$4, %r15	#, ivtmp.25
	movl	%eax, %ecx	#, _7
# hw2.c:40: 	array[j] = rand() % 1000 + 1;
	imull	%r12d	# tmp150
	movl	%ecx, %eax	# _7, tmp128
	sarl	$31, %eax	#, tmp128
	sarl	$6, %edx	#, tmp127
	subl	%eax, %edx	# tmp128, tmp124
	imull	$1000, %edx, %edx	#, tmp124, tmp129
	subl	%edx, %ecx	# tmp129, tmp130
# hw2.c:40: 	array[j] = rand() % 1000 + 1;
	addl	$1, %ecx	#, tmp131
	movl	%ecx, -4(%r15)	# tmp131, MEM[base: _20, offset: 0B]
# hw2.c:39: 	for(int j = 0;j < G_SIZE;j++){
	cmpq	%rbx, %r15	# _65, ivtmp.25
	jne	.L27	#,
	addq	$16000, -128(%rbp)	#, %sfp
	jmp	.L26	#
.L36:
# hw2.c:50: 	fclose(aFile);
	movq	-104(%rbp), %rdi	# %sfp,
	call	fclose@PLT	#
# hw2.c:54: }
	xorl	%eax, %eax	#
	movq	-56(%rbp), %rdi	# D.3153, tmp153
	xorq	%fs:40, %rdi	# MEM[(<address-space-1> long unsigned int *)40B], tmp153
	jne	.L37	#,
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L37:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	3894859413
	.long	1041313291
	.ident	"GCC: (GNU) 8.2.1 20180831"
	.section	.note.GNU-stack,"",@progbits
