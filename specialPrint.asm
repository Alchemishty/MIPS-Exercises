.eqv STACK_SIZE 8
.eqv STRING_INPUT 4($sp)
.eqv RETURN_ADDRESS ($sp)

.data
    prefix: .asciiz "*** "
    suffix: .asciiz " ***"    

.globl specialPrint

.text
specialPrint: 
    subi $sp, $sp, STACK_SIZE
    sw $a0, STRING_INPUT
    sw $ra, RETURN_ADDRESS    
    
    la $a0, prefix
    li $v0, 4
    syscall     
    
    lw $a0, STRING_INPUT
    jal stringUppercase
                
    la $a0, ($v0)
    li $v0, 4
    syscall  
      
    la $a0, suffix
    li $v0, 4
    syscall         
   
    lw $t1, RETURN_ADDRESS
    addi $sp, $sp, STACK_SIZE
    jr $t1