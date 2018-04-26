addi $t0,$t0,0
addi $t1,$t1,-1
addi $t2,$t2,1

sw $t1,0($t0)
sw $t2,4($t0)

lh $t3,0($t0)
lhu $t4,0($t0)

lh $t5,4($t0)
lhu $t6,4($t0)