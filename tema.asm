SECTION .data
    formatin: db "%d", 0
    formatout: db "Cel mai apropiat nr par este: %d", 10, 0 
 
    a: times 4 db 0 
    msg1 db  "Enter first number:  ", 0xA,0xD 
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
    jz evnn
    mov eax, 4
    mov ebx, 1
    jz incr
    int 0x80
 
    evnn:
    mov ah, 09h ;daca e par, il afiseaza
    mov eax, 4
    mov ebx, 1
    jz afisare_par
    int 0x80
    outprog:
    mov eax, 1
    int 0x80
 
    incr:
    mov eax, 0
    add eax, 1 ;daca e impar incerementeaza, apoi afiseaza cel mai apropiat nr par
    inc eax
    mov ebx, dword [fin]
    sub esp, 4
    mov [esp], ebx
    sub esp, 4
    mov [esp], dword formatout
    call printf                            
    add esp, 8
 
    afisare_par:
    mov ebx, dword [fin]
   sub esp, 4
   mov [esp], ebx
   sub esp, 4
   mov [esp], dword formatout
   call printf                            
   add esp, 8