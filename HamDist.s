.section .bss
.global ram
.lcomm ram, 2048


.section .data 
    msgOne: .ascii "this is a test"
    lenOne = . - msgOne
    msgTwo: .ascii "of the emergency broadcast"
    lenTwo = . - msgTwo

.section .text
    .global hamDist

hamDist:
    xor %rsi, %rsi
    xor %rdi, %rdi
    movq $0, %r12
    lea msgOne, %rsi
    lea msgTwo, %rdi
    movw $lenOne, %ax
    cmpw $lenTwo, %ax
    jl less_than
    lea msgOne, %rsi
    lea msgTwo, %rdi

    
greater_than:
    mov $lenTwo, %cl
    jmp L1

less_than:
    mov $lenOne, %cl
    jmp L1    

L1:
    movb (%rsi), %al
    movb (%rdi), %bl
    xorb %al, %bl
    mov $8, %rdx
    bitCount:
        shrb %bl
        adcq $0, %r12
        decq %rdx
        jnz bitCount 
    incq %rsi
    incq %rdi
    dec %cl
    jnz L1

    movq %r12, ram+0x0
    ret
.section .note.GNU-stack,"",@progbits
