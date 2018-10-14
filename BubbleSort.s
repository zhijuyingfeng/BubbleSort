$LC1:
        .ascii  "%d\012\000"
$LC0:
        .word   8
        .word   6
        .word   9
        .word   2
        .word   3
        .word   5
        .word   4
        .word   0
        .word   1
        .word   7
main:
        addiu   $sp,$sp,-88
        sw      $31,84($sp)
        sw      $fp,80($sp)
        move    $fp,$sp
        lui     $2,%hi($LC0)
        addiu   $3,$fp,36
        addiu   $2,$2,%lo($LC0)
        li      $4,40                 # 0x28
        move    $6,$4
        move    $5,$2
        move    $4,$3
        jal     memcpy
        nop

        sw      $0,24($fp)
$L6:
        lw      $2,24($fp)
        nop
        slt     $2,$2,9
        beq     $2,$0,$L2
        nop

        sw      $0,28($fp)
$L5:
        li      $3,9                        # 0x9
        lw      $2,24($fp)
        nop
        subu    $3,$3,$2
        lw      $2,28($fp)
        nop
        slt     $2,$2,$3
        beq     $2,$0,$L3
        nop

        lw      $2,28($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $3,12($2)
        lw      $2,28($fp)
        nop
        addiu   $2,$2,1
        sll     $2,$2,2
        addiu   $4,$fp,24
        addu    $2,$4,$2
        lw      $2,12($2)
        nop
        sltu    $2,$2,$3
        beq     $2,$0,$L4
        nop

        lw      $2,28($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $2,12($2)
        nop
        sw      $2,32($fp)
        lw      $2,28($fp)
        nop
        addiu   $2,$2,1
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $3,12($2)
        lw      $2,28($fp)
        nop
        sll     $2,$2,2
        addiu   $4,$fp,24
        addu    $2,$4,$2
        sw      $3,12($2)
        lw      $2,28($fp)
        nop
        addiu   $2,$2,1
        lw      $3,32($fp)
        sll     $2,$2,2
        addiu   $4,$fp,24
        addu    $2,$4,$2
        sw      $3,12($2)
$L4:
        lw      $2,28($fp)
        nop
        addiu   $2,$2,1
        sw      $2,28($fp)
        b       $L5
        nop

$L3:
        lw      $2,24($fp)
        nop
        addiu   $2,$2,1
        sw      $2,24($fp)
        b       $L6
        nop

$L2:
        sw      $0,24($fp)
$L8:
        lw      $2,24($fp)
        nop
        slt     $2,$2,10
        beq     $2,$0,$L7
        nop

        lw      $2,24($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $2,12($2)
        nop
        move    $5,$2
        lui     $2,%hi($LC1)
        addiu   $4,$2,%lo($LC1)
        jal     printf
        nop

        lw      $2,24($fp)
        nop
        addiu   $2,$2,1
        sw      $2,24($fp)
        b       $L8
        nop

$L7:
        move    $2,$0
        move    $sp,$fp
        lw      $31,84($sp)
        lw      $fp,80($sp)
        addiu   $sp,$sp,88
        j       $31
        nop