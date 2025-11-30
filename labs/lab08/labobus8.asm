%include 'in_out.asm'

SECTION .data
    func_msg db "Функция: f(x)=15x+2",0
    result_msg db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx           ; Извлекаем количество аргументов
    pop edx           ; Извлекаем имя программы
    sub ecx, 1        ; Уменьшаем количество аргументов (без имени программы)
    mov esi, 0        ; Инициализируем сумму результатов функции
    
    ; Выводим информацию о функции
    mov eax, func_msg
    call sprintLF
    
    cmp ecx, 0        ; Проверяем, есть ли аргументы
    jz _end           ; Если нет аргументов - выходим

next:
    pop eax           ; Извлекаем аргумент из стека
    call atoi         ; Преобразуем в число
    
    ; Вычисляем f(x) = 15x + 2
    mov ebx, eax      ; Сохраняем x в ebx
    imul eax, 15      ; Умножаем на 15: eax = 15x
    add eax, 2        ; Прибавляем 2: eax = 15x + 2
    
    add esi, eax      ; Добавляем результат к общей сумме
    
    loop next         ; Переход к следующему аргументу

_end:
    mov eax, result_msg ; Вывод сообщения "Результат: "
    call sprint
    mov eax, esi      ; Записываем сумму в eax
    call iprintLF     ; Выводим результат
    call quit         ; Завершаем программу
