.data
	#declarando variáveis
	ano1: .word 2006 #Adrian
	ano2: .word 2004 #Bruna
	ano3: .word 2003 #João Pedro
	ano4: .word 2005 #Lucas

.text
	#soma variáveis
	lw $t1, ano1 #alocando valores nos registradores
	lw $t2, ano2
	lw $t3, ano3
	lw $t4, ano4
	add $s0, $t1, $t2 #ano1 + ano2
	add $s1, $t3, $t4 #ano3 + ano4
	add $s2, $s0, $s1 #soma das somas

	#imprimir variável de saída
	move $a0, $s2
	li $v0, 1
	syscall

	#encerrar o programa 
	li $v0, 10
	syscall
