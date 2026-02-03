.text
.globl main
main:

li x10, 5  #n=5
li x11, 1 #factorial=1
li x12, 1 #base case=1
fact:
    mul x11,x11,x10  #fact=fact*x10
    addi x10, x10, -1 #x10=x10-1
    bne x12, x10, fact
    li x10, 1
    ecall 
end:
    j end 

    