addi $t0,$t0,0
addi $t1,$t1,1
addi $t2,$t2,2

add $s0,$t1,$t2
sub $s1,$t2,$t1
sw $s0,0($t0)
or $s1,$t0,$t2
and $s2,$t0,$t1
andi $s3,$t0,1
ori $s4,$t0,1
slt $s5,$t0,$t1
addi $t3,$0,-2
sltu $t4,$t3,$t0
lw $t5,0($t0)
sll $t6,$t5,2
srl $t7,$t5,1
