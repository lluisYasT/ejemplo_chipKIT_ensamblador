/*
 * Funcion que devuelve el factorial del numero pasado como parametro
 * Se declara como:
 * C: extern int fact(int n);
 * C++: extern "C" int fact(int n);
 */
	.text
	.globl	fact

fact:
			addi	$sp, $sp, -8		# Ajustamos el stack para guardar dos elemntos
			sw		$ra, 4($sp)			# Guardamos la direccion de retorno
			sw		$a0, 0($sp)			# Guardamos el primer (y unico) argumento
			slti	$t0, $a0, 1			# ¿Es n < 1 ?
			beq		$t0, $zero, L1	# Si n>=1, ir a L1
			addi	$v0, $zero, 1		# devuelve 1
			addi	$sp, $sp, 8			# Extrae dos elementos del stack
			jr		$ra							# Vuelve al sitio desde donde llamaron
	L1:
			addi	$a0, $a0, -1		# n >=1, el nuevo argumento es n-1
			jal		fact						# llama a fact con el nuevo argumento
			lw		$a0, 0($sp)			# Restaura el argumento n
			lw		$ra, 4($sp)			# Restaura la direccion de vuelt
			addi	$sp, $sp, 8			# Volvemos a ajustar el puntero del stack
			mul		$v0, $a0, $v0		# Devolvemos n * fact(n-1)
			jr		$ra							# Volvemos
