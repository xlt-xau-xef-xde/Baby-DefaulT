BITS 64

global _start

section .rodata

    equal db "Bien joué ! --> {1mAfl4G}", 10, 0
    equal_len equ $-equal

    above db "Mauvaise réponse !",10 ,0
    above_len equ $-above

    above_equal db "Mauvaise réponse !",10 ,0
    above_equal_len equ $-above_equal

    below db "Mauvaise réponse !",10 ,0
    below_len equ $-below

    below_equal db "Mauvaise réponse !",10 ,0
    below_equal_len equ $-below_equal

    troll db "yo bro this a fake function man", 10 , 0
    troll_len equ $-troll

section .text

_start:

    mov rax, 2000
    cmp rax, 2001
    je _equal
    ja _above
    jae _above_equal
    jb _below
    jbe _below_equal
    ja _easy
    syscall 

_equal:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, equal
    mov rdx, equal_len
    syscall
    jmp _exit

_above:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, above
    mov rdx, above_len
    syscall
    jmp _exit
    jmp _easy
    
_above_equal:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, above_equal
    mov rdx, above_len
    syscall
    jmp _exit
    jmp _easy

_below:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, below
    mov rdx, below_len
    syscall
    jmp _exit
    jmp _easy

_below_equal:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, below_equal
    mov rdx, below_equal_len
    syscall
    jmp _exit
    jmp _easy


_easy:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, troll
    mov rdx, troll_len
    syscall
    jmp _exit

_exit:
    mov rax, 0x3c
    mov rsi, 0x0
    syscall
