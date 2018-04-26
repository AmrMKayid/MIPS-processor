addi $t0,$t0,1
addi $t1,$t1,1

sw $t1,0($0)
lw $t2,0($0)
beq $t2,$t0,end
addi $t3,$t3,0
addi $t4,$t4,1
end:slt $t5,$0,$t2