;Programa de comparação de dois números informados em assembly
;Instrções cmp e jg  para estudo e pesquisa 
;Projeto - Assembly 2o bimestre/27-Nov-2023
;Author: Luiz Angelo, FEAP Computação | Versão: Diego Fukayama e Bruno Cotrim

SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

section .data 
    primeira_mensagem db "Digite o 1o número: ", 0
    len1 equ $-primeira_mensagem

    segunda_mensagem db "Digite o 2o número: ", 0
    len2 equ $-segunda_mensagem

    maior_mensagem db "O maior número é: ", 0
    len3 equ $-maior_mensagem

section .bss
    primeiro_numero resb 10
    segundo_numero resb 10
    
section .text
    global _start 
    
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, primeira_mensagem
    mov edx, len1
    int 0x80
    
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, primeiro_numero
    mov edx, 10
    int 0x80

; ------------------------------------------;

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, segunda_mensagem 
    mov edx, len2
    int 0x80
    
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, segundo_numero
    mov edx, 10
    int 0x80

; ------------------------------------------;

    mov eax, [primeiro_numero]
    mov ebx, [segundo_numero]
    cmp eax, ebx
    jg maior_primeiro
    
    maior_segundo:
        mov esi, segundo_numero
        jmp fim
        
    maior_primeiro:
        mov esi, primeiro_numero
        
fim:    
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, maior_mensagem
    mov edx, len3
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, esi
    mov edx, 10
    int 0x80

exit:
    mov eax, SYS_EXIT
    mov ebx, 0
    int 0x80
