.section .bss
.global ram
.lcomm ram, 2048



.section .text
    .global hamDist

hamDist:
    mov $0, %r12
    cmp %rcx, %rdx
    cmovg %rcx, %rdx
    mov %rdx, %rcx

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
    dec %rcx
    jnz L1

    movq %r12, %rax
    ret
.section .note.GNU-stack,"",@progbits
