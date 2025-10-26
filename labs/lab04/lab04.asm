SECTION .data        ; Начало секции данных
   hello:    db "Терентьев Максим", 0xa   ; 'Hello world!' плюс символ перевода строки
   helloLen: equ $ - hello             ; Длина строки hello

SECTION .text        ; Начало секции кода
   global _start     

_start:
   mov eax, 4        ; Системный вызов для записи (sys_write)
   mov ebx, 1        ; Описатель файла '1' - стандартный вывод
   mov ecx, hello    ; Адрес строки hello в ecx
   mov edx, helloLen ; Размер строки hello
   int 0x80          ; Вызов ядра

   mov eax, 1        ; Системный вызов для выхода (sys_exit)
   mov ebx, 0        ; Выход с кодом возврата '0' (без ошибок)
   int 0x80          ; Вызов ядра
