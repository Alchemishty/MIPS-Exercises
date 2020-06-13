.globl stringUppercase

.text
stringUppercase:
    subi $sp, $sp, 16
   	
    sw $a0, 12($sp)
    sw $ra, 8($sp)
    	
    jal stringCount
    addi $v0, $v0, 1
    
    sb $v0, 4($sp)
    
    lb $a0, 4($sp)
    li $v0, 9
    syscall
    
    li $t0, 0 #index count
    li $t1, 0x00 #null character
    lb $t3, 4($sp)
    
    sw $v0, ($sp)
    
    lw $a0, 12($sp)
    caseCheck:
        lb $t2, ($a0)
        beq $t0, $t3, addNull
        blt $t2, 97, copyChar
        bgt $t2, 122, copyChar
        sub $t2, $t2, 32
        j copyChar

    copyChar:
        sb $t2, ($v0)
        j nextChar
        		
    nextChar: 
        addi $a0, $a0, 1
        addi $v0, $v0, 1
        addi $t0, $t0, 1
        j caseCheck
    
    addNull:
        sb $t1, ($v0)
    	la $v0, ($sp)
    	
    	lw $t0, 8($sp)
    	addi $sp, $sp, 17
    	jr $t0
