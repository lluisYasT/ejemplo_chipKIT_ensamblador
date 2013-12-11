
		.globl leaf_example,return_pc
		.text

leaf_example:
							addi	$sp, $sp, -12 # Adjust stack to make room for three items
							sw		$t1, 8($sp)
							sw		$t0, 4($sp)
							sw		$s0, 0($sp)
							add		$t0,$a0,$a1
							add		$t1,$a2,$a3
							sub		$s0,$t0,$t1
							add		$v0,$s0,$zero
							lw		$s0, 0($sp)
							lw		$t0, 4($sp)
							lw		$t1, 8($sp)
							addi	$sp, $sp, 12
							jr		$ra

return_pc:
							add		$v0,$ra,$zero
							jr		$ra
