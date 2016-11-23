	.text
	.file	"fib.ll"
	.hidden	_Z3fibi
	.globl	_Z3fibi
	.type	_Z3fibi,@function
_Z3fibi:                                # @_Z3fibi
	.param  	i32
	.result 	i32
	.local  	i32
# BB#0:                                 # %entry
	i32.const	$push20=, 0
	i32.const	$push17=, 0
	i32.load	$push18=, __stack_pointer($pop17)
	i32.const	$push19=, 16
	i32.sub 	$push26=, $pop18, $pop19
	tee_local	$push25=, $1=, $pop26
	i32.store	__stack_pointer($pop20), $pop25
	i32.store	8($1), $0
	block   	
	block   	
	block   	
	block   	
	block   	
	i32.const	$push24=, -1
	i32.le_s	$push0=, $0, $pop24
	br_if   	0, $pop0        # 0: down to label4
# BB#1:                                 # %if.else
	i32.load	$push1=, 8($1)
	i32.eqz 	$push30=, $pop1
	br_if   	1, $pop30       # 1: down to label3
# BB#2:                                 # %if.else3
	i32.load	$push2=, 8($1)
	i32.const	$push27=, 1
	i32.ne  	$push3=, $pop2, $pop27
	br_if   	2, $pop3        # 2: down to label2
# BB#3:                                 # %if.then5
	i32.const	$push28=, 1
	i32.store	12($1), $pop28
	br      	3               # 3: down to label1
.LBB0_4:                                # %if.then
	end_block                       # label4:
	i32.const	$push29=, -1
	i32.store	12($1), $pop29
	br      	2               # 2: down to label1
.LBB0_5:                                # %if.then2
	end_block                       # label3:
	i32.const	$push16=, 0
	i32.store	12($1), $pop16
	br      	1               # 1: down to label1
.LBB0_6:                                # %if.else6
	end_block                       # label2:
	i32.load	$push5=, 8($1)
	i32.const	$push4=, 2
	i32.lt_s	$push6=, $pop5, $pop4
	br_if   	1, $pop6        # 1: down to label0
# BB#7:                                 # %if.then8
	i32.load	$push8=, 8($1)
	i32.const	$push7=, -1
	i32.add 	$push9=, $pop8, $pop7
	i32.call	$push10=, _Z3fibi@FUNCTION, $pop9
	i32.load	$push12=, 8($1)
	i32.const	$push11=, -2
	i32.add 	$push13=, $pop12, $pop11
	i32.call	$push14=, _Z3fibi@FUNCTION, $pop13
	i32.add 	$push15=, $pop10, $pop14
	i32.store	12($1), $pop15
.LBB0_8:                                # %return
	end_block                       # label1:
	i32.load	$0=, 12($1)
	i32.const	$push23=, 0
	i32.const	$push21=, 16
	i32.add 	$push22=, $1, $pop21
	i32.store	__stack_pointer($pop23), $pop22
	return  	$0
.LBB0_9:                                # %if.end13
	end_block                       # label0:
	unreachable
	unreachable
	.endfunc
.Lfunc_end0:
	.size	_Z3fibi, .Lfunc_end0-_Z3fibi


	.ident	"clang version 4.0.0 "
