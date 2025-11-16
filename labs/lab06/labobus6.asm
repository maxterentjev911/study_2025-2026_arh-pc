%include 'in_out.asm'

SECTION .data
expr: DB 'Вычисление выражения y = 10(x+1)-10',0
prompt: DB 'Введите x: ',0
result: DB 'Результат: y = ',0

SECTION .bss
x: RESB 10

SECTION .text
GLOBAL _start
_start:

mov eax, expr
call sprintLF

mov eax, prompt
call sprint

mov ecx, x
mov edx, 10
call sread

mov eax, x
call atoi

mov ebx, eax
add ebx, 1
mov eax, ebx
mov ecx, 10
mul ecx
sub eax, 10

mov edi, eax

mov eax, result
call sprint
mov eax, edi
call iprintLF

call quit
