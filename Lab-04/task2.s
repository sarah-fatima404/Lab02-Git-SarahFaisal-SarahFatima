.text
.globl main

main:

li x10, 5

ntri:
    addi sp, sp, -8 #adjust for 2 items
    sw x1, 4(sp) #return address
    sw x10, 0(sp) #n
    addi x9, x10, -1 #x5=n-1
    bge x9, x0, L1


    #base case
    addi x10, x0, 0 #return 0
    addi sp, sp, 8 #pop 2 items from stack
    jalr x0, 0(x1) #return


L1:
    addi x10, x10, -1 #-1
    jal x1, ntri 

    addi x6, x10, 0
    lw x10, 0(sp) #pop
    lw x1, 4(sp) #pop
    addi sp, sp, 8

    add x10, x10, x6 # num + ntri(num-1)
    jalr x0, 0(x1)