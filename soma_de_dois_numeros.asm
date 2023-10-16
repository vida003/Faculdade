;Programa Soma de dois números de 1 digito
;Introdução ao Assembly
;Author: Luiz Angelo, FEAP
;Version: Diego Fukayama, Eng. da Computação
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data 
msg1 db 'insira um digito', 0xa, 0xd
len1 equ $ - msg1

msg2 db 'insira o segundo digito', 0xa, 0xd
len2 equ $ - msg2

msg3 db 'a soma é: '
len3 equ $ - msg3

section .bss
num1 resb 2
num2 resb 2
res  resb 2

section .text
global _start
_start:

; Escreva a mensagem "insira um digito"
mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg1
mov edx, len1
int 0x80

; Leia o primeiro dígito
mov eax, SYS_READ
mov ebx, STDIN
mov ecx, num1
mov edx, 2
int 0x80

; Escreva a mensagem "insira o segundo digito"
mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg2
mov edx, len2
int 0x80

; Leia o segundo dígito
mov eax, SYS_READ
mov ebx, STDIN
mov ecx, num2
mov edx, 2
int 0x80

; Converta os dígitos em números inteiros
movzx eax, byte [num1]
sub  al, '0'
movzx ebx, byte [num2]
sub  bl, '0'

; Realize a soma
add al, bl

; Converta a soma em caractere
add al, '0'
mov [res], al

; Escreva a mensagem "a soma é: "
mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg3
mov edx, len3
int 0x80

; Escreva o resultado
mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, res
mov edx, 1
int 0x80

; Saia do programa
mov eax, SYS_EXIT
mov ebx, 0
int 0x80
