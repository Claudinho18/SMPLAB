                 
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
include 'emu8086.inc'

.data
           val1     DB      ?
           nl1      DB      0AH,0DH,'Introduceti numarul de verificat:','$'
           nl2      DB      0AH,0DH,'Nu e prim!','$'
           nl3      DB      0AH,0DH,'E prim!','$' 
           
           w equ 50 ; dimensiune dreptunghi
           h equ 50

.code
call deschidere

hlt

; procedura de deschidere a programului
deschidere proc
    ; curatam ecranul
  
    call stergere
    
    printn "Joc interactiv"
    ;trecem pe linia urmatoare
    putc 13
    putc 10
  
    printn "Apasa orice tasta pentru a incepe un joc nou."
    ; asteptam tasta apasata de utilizator
    mov ah, 1
    int 21h
    mov dl, 07h
    mov ah, 2
    int 21h
    call meniu  
ret
deschidere endp

; meniu principal
; 
meniu proc
    ; curatam ecranul
    
    call stergere
    
   printn "Joc interactiv"
    putc 13
    putc 10
    putc 13
    printn "Alegeti optiunea dorita."
    putc 10
    putc 13
    printn "1) Joc matematic"
    printn "2) Numere prime"  
    printn "3) Joaca cu mouse-ul"
    printn "4) Exit"
   
    ; asteptam optiunea introdusa de catre utilizator
    mov ah, 1
    int 21h
    
    cmp al, "1"
    je optiune_1
    ; a doua optiune aleasa, trecem la urmatorul ecran
    cmp al, "2"
    je optiune_2 
     ; a treia optiune aleasa, trecem la urmatorul ecran
    cmp al, "3"
    je optiune_3 
      ; a patra optiune aleasa, trecem la urmatorul ecran
    cmp al, "4"
    je optiune_4
    ;in cazul in care apasa gresit decat 1 2 3 4 se reafiseaza ecranul
    cmp al, "4"
    jg meniu
    cmp al, "1"
    jmp meniu
ret
meniu endp


optiune_1 proc
    
    call operatie_1
ret
optiune_1 endp

operatie_1 proc 
    call stergere
    putc 10
    putc 13
    printn "Intrebarea 1" 
    putc 10
    putc 13
    printn "Care e rezultatul calculului?"
    putc 10
    putc 13
    printn "5+3=?"
    mov ah, 1
    int 21h
    cmp al, "8"
    je lat1
    cmp al, "8"
    jg  gresit
    cmp al, "8"
    jmp gresit

lat1:
    mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200  
    int 10h
             
             ; latura din stanga dreptunghi
    mov cx, 100
    mov dx, 20+h
    mov al, 5
  u5: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u5  
    jmp operatie_2
gresit:
    putc 10
    putc 13
    printn "Raspuns gresit.La revedere!"
    jmp meniu   
        
     
operatie_1 endp

operatie_2 proc 
    call stergere
    putc 10
    putc 13
    printn "Intrebarea 2" 
    putc 10
    putc 13
    printn "Care e rezultatul calculului?"
    putc 10
    putc 13
    printn "3*2=?"
    mov ah, 1
    int 21h
    cmp al, "6"
    je lat11
    cmp al, "6"
    jg  gresit
    cmp al, "6"
    jmp gresit

lat11:
    mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200  
    int 10h
             
             ; latura din stanga dreptunghi
    mov cx, 100
    mov dx, 20+h
    mov al, 5
  u51: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u51 
    jmp lat2 
lat2:    
; latura din dreapta dreptunghi
    mov cx, 100+w
    mov dx, 20+h
    mov al, 5       
   u6: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u6
    jmp operatie_3   
;gresit:
;    putc 10
;    putc 13
;    printn "Raspuns gresit.La revedere!"
;    jmp meniu   
        
     
operatie_2 endp

operatie_3 proc
    call stergere
    putc 10
    putc 13
    printn "Intrebarea 3" 
    putc 10
    putc 13
    printn "Care e rezultatul calculului?"
    putc 10
    putc 13
    printn "2*2-3+2*2-2=?"
    mov ah, 1
    int 21h
    cmp al, "3"
    je lat12
    cmp al, "3"
    jg  gresit
    cmp al, "3"
    jmp gresit 
    mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200  
    int 10h
             
             ; latura din stanga dreptunghi
lat12: 
    mov ah, 0
    mov al, 13h ; trecere in mod grafic 320x200  
    int 10h
    mov cx, 100
    mov dx, 20+h
    mov al, 5
   u52: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u52
    jmp lat22            
    ; latura din dreapta dreptunghi 
lat22:
    mov cx, 100+w
    mov dx, 20+h
    mov al, 5       
    u62: mov ah, 0ch
    int 10h
    inc dx
    cmp dx, 110
    jb u62
    jmp lat3    
lat3:
    ;latura de jos dreptnghi   
    mov cx, 100+w
    mov dx, 110
    mov al, 5
   u7: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 100
    ja u7
    jmp lat4   


lat4:
    ; afisare latura inferioare
    mov cx, 100+w ;axa ox
    mov dx, 20+h  ;axa oy 
    mov al, 12 ;culoarea
   u8: mov ah, 0ch ;deseneaza
    int 10h
    dec cx
    cmp cx, 100 ;compara pentreu oprire la 100
    ja u8
    jmp meniu
operatie_3 endp       

    

         
;procedura numere prime         
prim  proc
    mov ax,@data
    mov ds,ax
    lea dx,nl1
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov val1,al        
    mov ah,00
    mov cl,2
    div cl
    mov cl,al
            
    etapa1:
        mov ah,00
        mov al,val1
        div cl
        cmp ah,00
        jz etapa2
        dec cl
        cmp cl,1
        jne etapa1
        jmp etapa3
    
    etapa2:
    
        mov ah,09h
        lea dx,nl2
        int 21h
        jmp Return
            
    Return:
        putc 10
        putc 13
        printn "Apasa orice tasta pentru a reveni la deschidere."
        ; asteptam optiunea introdusa de catre utilizator
        mov ah, 1
        int 21h
        call meniu
    
    etapa3:
        mov ah,09h
        lea dx,nl3
        int 21h 
        call Return
    
    EXIT:
        mov ah,4ch
        int 21h 
prim    endp
    
            

optiune_2 proc 
    call stergere
    call prim 
    
    putc 10
    putc 13
    printn "Apasa orice tasta pentru a reveni la deschidere."
    ; asteptam optiunea introdusa de catre utilizator
    mov ah, 1
    int 21h
    call deschidere
ret
optiune_2 endp


optiune_3 proc 
    call stergere
    jmp start
    oldX dw -1
    oldY dw 0
    start:
    mov ah, 00
    mov al, 13h ; mod grafic 256 culori, 320x200 pixels
    int 10h

    mov ax, 0 ; ini?ializare mouse
    int 33h
    cmp ax, 0
    ;mov ax, 1 ; afi?are cursor mouse – op?ional
    ;int 33h
    check_mouse_button:
    mov ax, 3
    int 33h ; preluare pozi?ie ?i status butoane
    shr cx, 1 ; x/2 – în modul grafic este dublata coordonata x
    cmp bx, 1
    jne xor_cursor:
    mov al, 1010b ; culoare punct
    jmp draw_pixel
    xor_cursor:
    cmp oldX, -1
    je not_required
    push cx
    push dx
    mov cx, oldX
    mov dx, oldY
    mov ah, 0dh
    int 10h
    xor al, 1111b
    mov ah, 0ch
    int 10h
    pop dx
    pop cx
    not_required:
    mov ah, 0dh
    int 10h
    xor al, 1111b
    mov oldX, cx
    mov oldY, dx
    draw_pixel:
    mov ah, 0ch
    int 10h
    check_esc_key:
    mov dl, 255
    mov ah, 6
    int 21h
    cmp al, 27 ; esc?
    jne check_mouse_button
    stop:
    ;mov ax, 2 ; ascunde cursor mouse – op?ional
    ;int 33h

    mov ax, 3 ; înapoi în mod text 80x25
    int 10h
    mov ah, 1
    mov ch, 0
    mov cl, 8
    int 10h

    printn "Apasa orice tasta pentru a reveni la deschidere."
    ; asteptam optiunea introdusa de catre jucator
    mov ah, 1
    int 21h
    call meniu 
ret 
optiune_3 endp

optiune_4 proc
    mov dl, 07h
    mov ah, 2
    int 21h
jmp EXIT

ret
optiune_4 endp

; procedura pentru golirea ecranului

stergere proc
    mov ah, 0
    mov al, 3
    int 10h
ret
stergere endp



DEFINE_PRINT_STRING
