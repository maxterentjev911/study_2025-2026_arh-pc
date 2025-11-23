%include 'in_out.asm'
section .data
    msg1 db 'Введите x: ',0h
    msg2 db 'Введите a: ',0h
    msg3 db 'Результат: ',0h
section .bss
    x   resb 10
    a   resb 10
    res resb 10
section .text
    global _start
_start:
    ; Ввод переменной 'x'
    mov eax, msg1
    call sprint     ; Вывод "Введите x: "
    mov ecx, x
    mov edx, 10
    call sread      ; Считываем x как строку
    mov eax, x
    call atoi       ; Преобразуем строку в число
    mov [x], eax    ; Сохраняем число в память
    ; Ввод переменной 'a'
    mov eax, msg2
    call sprint     ; Вывод "Введите a: "
    mov ecx, a
    mov edx, 10
    call sread      ; Считываем a как строку
    mov eax, a
    call atoi       ; Преобразуем строку в число
    mov [a], eax    ; Сохраняем число в память
    ; Основная логика (Сравнение)
    mov ecx, [x]    ; Кладем x в регистр
    cmp ecx, 0      ; Сравниваем x с нулем
    je is_zero      ; Если x равно 0, прыгаем на метку is_zero
    ; Ветка: Если x != 0 (Формула: 4a + x)
    mov eax, [a]    ; Берем a
    mov ebx, 4
    mul ebx         ; Умножаем a на 4 (eax = 4*a)
    
    add eax, [x]    ; Прибавляем x (eax = 4a + x)
    mov [res], eax  ; Сохраняем результат
    jmp print_res   ; Прыгаем на вывод (чтобы пропустить ветку для нуля)
is_zero:
    ; Ветка: Если x = 0 (Формула: 4a)
    mov eax, [a]    ; Берем a
    mov ebx, 4
    mul ebx         ; Умножаем a на 4
    mov [res], eax  ; Сохраняем результат
print_res:
    ; Вывод результата
    mov eax, msg3
    call sprint     ; Вывод "Результат: "
    mov eax, [res]
    call iprintLF   ; Вывод самого числа
    call quit       ; Выход
