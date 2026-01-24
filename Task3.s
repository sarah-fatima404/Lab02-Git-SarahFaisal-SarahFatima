.text
.globl main
main:
    li x20, 5    #a=5
    add x21, x0, x0 #b=0+0
    addi x20, x21, 32 #a=b+32

    add x5, x20, x21 #x5=a+b
    li x6, 5
    sub x22, x5, x6 #d=(a+b)-5

    sub x7, x20, x22 #x7=a-d
    sub x8, x21, x20 #x8=b-a
    add x9, x7, x8   #x9=(a-d)+(b-a)
    add x23, x9, x22 # e = (((a- d) + (b- a)) + d)

    add x23, x23, x5  #e=a+b+e
    add x23, x23, x22 #e=a+b+d+e

end:
    j end