.data
    myText: .asciiz "A claim!"

.globl main

.text
main:
    la $a0, myText
    jal specialPrint
      
    li $v0, 10
    syscall
