;Programa hardcode 'Diego Fukayama'
;Introducao ao Assembly
;Author: Luiz Angelo, FEAP
;Version: Diego Fukayama, Eng. da Computacao
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    msg1    db "A soma é: "
    len     equ $-msg1 ;coleta o tamanho da variavel msg1
    
section .bss
;reserve byte 1
;ira reservar 1 byte na var res
;res na verdade representa um end. de memoria
    res resb 1

section .text
    global _start
    
_start:
;eax = 7 (3+4)
    mov eax, 3
    mov ebx, 4
    add eax, ebx
    
;transforma 7 inteiro em string para ser imprimido
    add eax, '0'

;move eax (7) para o end. contido na var res
    mov [res], eax
    
    ;imprime "A soma é: "
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len
    int 0x80
    
    ;imprime o conteudo que se encontra na memoria em res que no caso se refere ao 7
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1 ;indica que vai ser escrito 1 byte apenas
    int 0x80

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx ;indica que o termino do programa ocorreu bem, ja que o valor de ebx vai ser 0
    int 0x80
