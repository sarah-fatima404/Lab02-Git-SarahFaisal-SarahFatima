.text
.globl _start

_start:
    # Setup base addresses and stack
    li t3, 5              # Constant value (unused mostly)
    li sp, 511            # Initialize Stack Pointer
    li t0, 768            # Switch Address (0x300)
    li t1, 512            # LED Address (0x200)

    # Initial setup write (mimicking original behavior)
    sw t3, 0(t0)

WAIT_FOR_INPUT:
    # Clear output display
    sw zero, 0(t1)

POLL_SWITCHES:
    # Read switch value
    lw a1, 0(t0)
    beqz a1, POLL_SWITCHES   # Wait for non-zero input

    # Prepare for countdown
    mv a0, a1                # Move switch value to argument register
    jal ra, DO_COUNTDOWN     # Call subroutine

    # Loop back to wait state
    j WAIT_FOR_INPUT

DO_COUNTDOWN:
    # Prologue: Allocate stack and save registers
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)             # Save s0 (callee-saved)

    mv s0, a0                # Use s0 for the counter

LOOP_COUNT:
    # Display current value
    sw s0, 0(t1)
    
    # Check if finished
    beqz s0, FINISH

    # Decrement counter
    addi s0, s0, -1

    # Delay Loop
    li t2, 3                 # Delay counter (adjust as needed)
DELAY_WAIT:
    addi t2, t2, -1
    bnez t2, DELAY_WAIT
    
    j LOOP_COUNT

FINISH:
    # Clear display
    sw zero, 0(t1)

    # Epilogue: Restore registers and return
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret

end_loop:
    j end_loop