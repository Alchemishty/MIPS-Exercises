.globl stringCount

.text
stringCount:	
    li $v0, 0
    la $t0, ($a0)	
    
    forStart:
        beqz $t0, forEnd
        addi $v0, $v0, 1
        addi $a0, $a0, 1    
        lb $t0, ($a0) 
        j forStart
    forEnd:
        jr $ra
