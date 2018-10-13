.data 
    arr: .space 40
    i: .word 0
    ii: .word 9

.text

.globl main
#8,6,9,2,3,5,4,0,1,7
main:
    la $s6, arr
    addi $t1, $zero, 8
    sw $t1, 0($s6)
    addi $t1, $zero, 6
    sw $t1, 4($s6)
    addi $t1, $zero, 9
    sw $t1, 8($s6)
    addi $t1, $zero, 2
    sw $t1, 12($s6)
    addi $t1, $zero, 3
    sw $t1, 16($s6)
    addi $t1, $zero, 5
    sw $t1, 20($s6)
    addi $t1, $zero, 4
    sw $t1, 24($s6)
    addi $t1, $zero, 0
    sw $t1, 28($s6)
    addi $t1, $zero, 1
    sw $t1, 32($s6)
    addi $t1, $zero, 7
    sw $t1, 36($s6)

    #test