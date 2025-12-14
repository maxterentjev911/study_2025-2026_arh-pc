%include 'in_out.asm'
SECTION .data
filename db 'name.txt', 0h
msg_ask db 'Как Вас зовут? ', 0h
msg_intro db 'Меня зовут ', 0h
SECTION .bss
user_input resb 255
SECTION .text
    global _start
_start:
    ; Печать приглашения
    mov eax, msg_ask
    call sprint
    ; Ввод имени с клавиатуры
    mov ecx, user_input
    mov edx, 255
    call sread
    ; Создание файла
    mov ecx, 0777o      ; Права доступа
    mov ebx, filename
    mov eax, 8          ; Системный вызов sys_creat
    int 80h
    mov esi, eax        ; Сохраняем дескриптор файла
    ; Запись фразы "Меня зовут"
    mov eax, msg_intro
    call slen           ; Получаем длину строки
    mov edx, eax
    mov ecx, msg_intro
    mov ebx, esi
    mov eax, 4          ; Системный вызов sys_write
    int 80h
    ; Запись введенного имени
    mov eax, user_input
    call slen
    mov edx, eax
    mov ecx, user_input
    mov ebx, esi
    mov eax, 4
    int 80h
    ; Закрытие файла
    mov ebx, esi
    mov eax, 6          ; Системный вызов sys_close
    int 80h

    call quit
