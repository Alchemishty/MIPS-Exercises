.eqv STACK_SIZE 16
.eqv STRING_INPUT 12($sp)
.eqv RETURN_ADDRESS 8($sp)
.eqv STRING_LENGTH 4($sp)
.eqv STRING_UPPERCASE ($sp)

.globl stringUppercase

.text
stringUppercase:
    subi $sp, $sp, STACK_SIZE
   	
    sw $a0, STRING_INPUT
    sw $ra, RETURN_ADDRESS
    	
    jal stringCount
    addi $v0, $v0, 1
    
    sb $v0, STRING_LENGTH
    
    lb $a0, STRING_LENGTH
    li $v0, 9
    syscall
    
    li $t0, 0 #index count
    li $t1, 0x00 #null character
    lb $t3, STRING_LENGTH
    
    sw $v0, STRING_UPPERCASE
    
    lw $a0, STRING_INPUT
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
    	la $v0, STRING_UPPERCASE
    	
    	lw $t0, RETURN_ADDRESS
    	addi $sp, $sp, STACK_SIZE
    	jr $t0
