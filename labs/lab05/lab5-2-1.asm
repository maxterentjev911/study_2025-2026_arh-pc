%include 'in_out.asm'    ; подключение внешнего файла

SECTION .data    ; Секция инициированных данных
msg: DB 'Введите строку: ',0h  ; сообщение

SECTION .bss    ; Секция не инициированных данных
buf1: RESB 80    ; Буфер размером 80 байт

SECTION .text    ; Код программы
GLOBAL _start    ; Начало программы
_start:    ; Точка входа в программу

; Вывод приглашения
mov eax, msg
call sprint

; Ввод строки
mov ecx, buf1
mov edx, 80
call sread

; Вывод введенной строки
mov eax, buf1
call sprintLF

; Завершение программы
call quit
