.data 
    arr: .space 40
    i: .word -1
    ii: .word -1
    max: .word 8
    newline: .asciiz "\n"

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

    lw $s1, i
    lw $s5, max

    li $t4, -4
    li $s4, 36
 
outer:
    addi $s1, $s1, 1
    bgt $s1, $s5, output#if (i>8)exit else enter inner loop

    lw $s2, ii#s2<-- ii
    li $t7, -4#store dispalcement


    #inner loop
inner:
    addi $t7, $t7, 4#the value $t7 adds 4
    addi $s2, $s2, 1#the value ii($s2) adds 1
    
    sub $s3, $s5, $s1#$s3<--$s5-$s1=8-i
    bgt $s2, $s3, outer#if(ii>8-i)end inner loop

    add $t5, $s6, $t7
    lw $t0, ($t5)#$t0<--arr[ii]
    lw $t1, 4($t5)#<-- arr[ii+1]
    
    #if(arr[ii+1]>arr[ii] back to inner loop
    bgt $t1, $t0, inner

    #swap arr[ii] and arr[ii+1]
    sw $t1, ($t5)#arr[ii]<--$t1=arr[ii+1]
    sw $t0, 4($t5)#arr[ii+1]<--$t0=arr[ii]

    b inner

output:
    addi $t4, $t4, 4			# $t4<--$t4+4
    bgt $t4, $s4, exit#if($t4>36) exit
    add $t2, $s6, $t4#$t2<-- $s6+$t4
    lw $t3, 0($t2)#read arr[i]
    move $a0, $t3
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    b output

exit:
    li $v0,10
    syscall