
addi $t1,$t1,77
addi $t2,$t2,-5
addi $t4,$t4,6
addi $t5,$t5,7
addi $t6,$t6,8
sw $t1,0($0)
lw $t7,0($0)
sll $s0,$t4,3
srl $s1,$t4,2
addi $t3,$t3,1
addi $t0,$t0,1
sw $t2,4($0)
lh $s2,4($0)
lhu $s3,4($0)
beq $t3,$t0,end
nop
nop
nop
sub $s0,$s0,$t6
add $s0,$s0,$t6
end:slt $s7,$t2,$t4
addi $t1,$t1,1