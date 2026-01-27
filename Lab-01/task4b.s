.text
.globl main
main:
#A
li x10, 0x01020304
li x11, 0x01000200
li x12, 0x00000000

# li x4, 0x100
# li x5, 0x200
# li x6, 0x300

sw x10,0x100(x0)
sw x11,0x200(x0)
sw x12,0x300(x0)

end:
    j end 
