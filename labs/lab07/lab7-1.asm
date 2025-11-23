%include    'in_out.asm'    ; подключение внешнего файла

SECTION .data
msg1: DB 'Сообщение № 1',0
msg2: DB 'Сообщение № 2',0
msg3: DB 'Сообщение № 3',0

SECTION .text
GLOBAL _start
_start:
    jmp _label3      ; Сначала прыгаем сразу к 3-му сообщению

_label1:
    mov eax, msg1    ; Вывод на экран строки
    call sprintLF    ; 'Сообщение № 1'
    jmp _end         ; После 1-го сообщения — выход

_label2:
    mov eax, msg2    ; Вывод на экран строки
    call sprintLF    ; 'Сообщение № 2'
    jmp _label1      ; После 2-го сообщения прыгаем к 1-му

_label3:
    mov eax, msg3    ; Вывод на экран строки
    call sprintLF    ; 'Сообщение № 3'
    jmp _label2      ; После 3-го сообщения прыгаем ко 2-му

_end:
    call quit        ; вызов подпрограммы завершения
