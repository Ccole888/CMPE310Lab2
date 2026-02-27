.section .bss
.global ram
.lcomm ram, 2048


.section .text
    .global hamDist

hamDist:
    
    ret
.section .note.GNU-stack,"",@progbits
