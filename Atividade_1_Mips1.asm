.data
	array:.word 4, 3, 9, 5, 2, 1 #nossa array
	n: .word 6  #tamanho da array

.text
    	la $t0, array  #endereço da array
    	lw $t1, n 
    
	outerLoop:
		addi $t2, $zero, 0 #contador interno com i = 0
    		addi $t3, $t1, -1  #n - 1 para diminuir o contador

	innerLoop:
   		beq $t2, $t3, nextPass #se o indice i == n-1, fim do loop interno

    		# carrega a array[i] e array[i+1]
    		sll $t4, $t2, 2  #desloca i*4 (endereço da posição i)
    		add $t5, $t0, $t4
    		lw $t6, 0($t5)  #lê o valor $t6 array[i]
    		lw $t7, 4($t5)  #lê o valor $t7 array[i+1]

    		# compara e troca caso necessário
    		ble $t6, $t7, noSwap
    		sw $t7, 0($t5)  #array[i] = array[i+1]
    		sw $t6, 4($t5)  #array[i+1] = array[i]

	noSwap: #não ocorre a troca e continua i++
		addi $t2, $t2, 1  
    		j innerLoop

	nextPass:
    		addi $t1, $t1, -1     #n-- diminui o limite do loop externo
    		bgt $t1, 1, outerLoop  #enquanto n > 1, continua

    		# imprime o resultado
    		la $t0, array
    		lw $t1, n

	printLoop:
    		beqz $t1, end  #se n==0, fim
    		lw $a0, 0($t0) #carrega o valor
    		li $v0, 1 
    		syscall

    		addi $t0, $t0, 4  #chama o próximo valor da array
    		addi $t1, $t1, -1
    		j printLoop

	end: #encerra o programa
    		li $v0, 10            
    		syscall
