.data
    A: .word 83, 32, 37, 70, 98, 53, 38, 18, 98, 14, 32, 92, 14, 74, 61, 62, 99, 83, 39, 95
    B: .word 98, 3, 78, 75, 31, 91, 62, 67, 99, 76, 79, 43, 31, 23, 47, 80, 32, 56, 77, 26, 37, 21, 77, 24, 37, 32, 88, 4, 18, 64
    S: .space 80#store the same elements
.text

.globl main

BubbleSort:

    #$a0-->address of array
    #$a1-->the number of array elements

    sw $t1, -4($sp)#store i
    sw $t2, -8($sp)#store j
    sw $t3, -12($sp)#store arr+j
    sw $t4, -16($sp)#store arr[j]
    sw $t5, -20($sp)#store arr[j+1]
    sw $t6, -24($sp)#store n-2
    sw $t7, -28($sp)#store n-2-i
    addi $sp, $sp, -32

    li $t1, -1
    addi $t6, $a1, -2#$t6<-- n-2 

outer:
    addi $t1, $t1, 1#i++
    bgt $t1, $t6, return#if(i>n-2) return
    li $t2, 0#$t2<-- 0
    move $t3, $a0
    sub $t7, $t6, $t1#n-2-i=$t7

inner:
    bgt $t2, $t7, outer#if(j>n-2-i) returnb outer loop
    lw $t4, 0($t3)#load arr[j]
    lw $t5, 4($t3)#load arr[j+1]

    bgt $t5, $t4, increase #if(arr[j+1]>arr[j]) enter increasing
    sw $t5, 0($t3)#arr[j]<-- arr[j+1]
    sw $t4, 4($t3)#arr[j+1]<-- arr[j]

increase:
    addi $t2, $t2, 1#j++
    addi $t3, $t3, 4#address of array backward 4
    b inner

return:
    addi $sp, $sp, 32
    lw $t7, -28($sp)
    lw $t6, -24($sp)
    lw $t5, -20($sp)
    lw $t4, -16($sp)
    lw $t3, -12($sp)
    lw $t2, -8($sp)
    lw $t1, -4($sp)
    jal $ra

main:

    #Sort A array
    la $a0, A
    li $a1, 20
    b BubbleSort
    
    #Sort B array
    la $a0, B
    li $a1, 30
    b BubbleSort



    li $v0, 10
    syscall
