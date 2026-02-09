.text
.globl main

main:

li x10, 0x100 #x[] base address
li x11, 4 #len

li x5, 3
li x6, 4
li x7, 5
li x8, 1

sw x5, 0(x10) #x[0]=3
sw x6, 4(x10) #x[1]=4
sw x7, 8(x10)#x[2]=5
sw x8, 12(x10) #x[3]=1

insertion_sort:
    # base case
    li   x5, 1
    ble  x11, x5, done #if n<=1, return

    #stack frame
    addi x2, x2, -16
    sw   x1, 12(x2)
    sw   x10, 8(x2)
    sw   x11, 4(x2)

    # recursive call: insertion_sort(arr, n-1)
    addi x11, x11, -1
    jal  x1, insertion_sort

    # restore registers
    lw   x11, 4(x2)
    lw   x10, 8(x2)
    lw   x1, 12(x2)
    addi x2, x2, 16

    addi x6, x11, -1  #key = arr[n-1]
    slli x6, x6, 2
    add  x6, x10, x6
    lw   x7, 0(x6)  #key

    addi x28, x11, -2 #j=n-2

insert_loop:
    blt  x28, x0, insert_key #if j<0, insert

    slli x29, x28, 2
    add  x29, x10, x29
    lw   x30, 0(x29)      #arr[j]

    ble  x30, x7, insert_key #if arr[j]<=key, insert

    sw   x30, 4(x29)      # arr[j+1] = arr[j]
    addi x28, x28, -1
    j    insert_loop

insert_key:  
    addi x28, x28, 1
    slli x29, x28, 2
    add  x29, x10, x29
    sw   x7, 0(x29)       # arr[j+1] = key

done:
    ret
