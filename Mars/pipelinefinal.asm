addi $t0,$t0,8
addi $t1,$t1,-4
addi $t2,$t2,4
addi $t3,$t3,77
addi $t4,$t4,50
sw $t1,0($0)
sw $t2,4($t2)
lw $s0,0($0)
lw $s1,4($t2)
add $t5,$t0,$t1
sub $t6,$t3,$t4
and $t7,$t0,$t4
or  $s2,$t0,$0
andi $s3,$t0,1
ori $s4,$t2,8
sll $t4,$t0,2
srl $t3,$t0,1
addi $t7,$0,4
slt $s5,$s0,$s1
sltu $s6,$s0,$s1
lh $s2,0($0)
lhu $s3,0($0)
lh $t5,4($t2)
lhu $t6,4($t2)
beq $t2,$t7,end
nop
nop
nop
andi $t1,$t1,0
addi $t1,$t1,8
end:add $t2,$t7,$t2
beq $t0,$t3,end
nop
nop
nop
addi $t0,$t0,1







