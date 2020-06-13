.data
    prefix: .asciiz "*** "
    suffix: .asciiz " ***"	

.globl specialPrint

.text
specialPrint: 
    subi $sp, $sp, 8
    sw $a0, 4($sp)	
    sw $ra, ($sp)		
    
    la $a0, prefix
    li $v0, 4
    syscall     
    
    lw $a0, 4($sp)
    jal stringUppercase
                
    la $a0, ($v0)
    li $v0, 4
    syscall  
      
    la $a0, suffix
    li $v0, 4
    syscall         
   
    lw $t1, ($sp)
    addi $sp, $sp, 8
    jr $t1
