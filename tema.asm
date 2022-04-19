SECTION .data
    formatin: db "%d", 0
    formatout: db "Nr impar: %d"

    a: times 4 db 0 
    msg1 db  "a =   ", 0xA,0xD 
    len1 equ $ - msg1

SECTION .text
   global _main 
   extern scanf 
   extern printf 

   global main

main:

    mov eax, 4	
    mov ebx, 1    
    mov ecx, msg1
    mov edx, len1
    int 80h    
    
    ;citire a
    sub esp, 4
   mov [esp], dword a
   sub esp, 4
   mov [esp], dword formatin
   call scanf
   add esp, 8

    ; verificare paritate
    mov ax, a
    and ax, 1
	not ax, 1
    jz odd
    mov eax, 4
    mov ebx, 1
    jz incr
    int 0x80

    odd:
    mov ah, 09h ;
    mov eax, 4
    mov ebx, 1
    mov ebx, dword [fin]
    sub esp, 4
    mov [esp], ebx
    sub esp, 4
    mov [esp], dword formatout
    call printf                            
    add esp, 8
    int 0x80
    outprog:
    mov eax, 1
    int 0x80

    incr:
    mov eax, 0
    add eax, 1 
    inc eax
    mov ebx, dword [fin]
    sub esp, 4
    mov [esp], ebx
    sub esp, 4
    mov [esp], dword formatout
    call printf                            
    add esp, 8

    