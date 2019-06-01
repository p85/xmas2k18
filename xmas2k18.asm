section .data
	sy: db 1d,
	sx: db 40d,
	c: db 1d,
	t: db 0d,
	printchar: db 0d,

section .text
global _start
_start:
	call clearscreen
_start2:
	call init
	call printthreetriangles
	inc byte [sy]
	add byte [sx], 5d
startl2:
	mov cl,[c]
startl1:
	push cx
	call printthreetriangles
	pop cx
	sub byte [sx], 7d
	sub byte [sy], 3d
	dec cl
	cmp cl,0d
	jnz startl1
	add byte [sy], 4d

	add byte [sx], 20d
	mov al,[t]
	add byte [sx], al

	add byte [t], 8d
	inc byte [c]
	cmp byte [c], 6d
	jne startl2
	jmp _start2

clearscreen:
	mov ah, 0h
	mov al, 3h
	int 10h
	mov ah,9h
	mov al,32d
	mov bl,2d
	mov cx,2000d
	int 10h
	ret

init:
	mov byte [sy],1d
	mov byte [sx],40d
	mov byte [c],2d
	mov byte [t],0d
	ret

printthreetriangles:
	mov cl,3d
	pttl:
	cmp cl,2d
	jne ptt2
	inc byte [sy]
	inc byte [sx]
	ptt2:
	cmp cl,1d
	jne ptt1
	dec byte [sy]
	sub byte [sx], 5
	ptt1:
	dec cl
	call printtriangle
	cmp cl,0d
	jnz pttl
	ret

print:
	mov ah,02h
	mov dh,[sy]
	mov dl,[sx]
	int 10h
	mov ah,9h
	mov al,[printchar]

	add bl,[fs:046ch]
	shr bl,4
	and bl,[sx]
	inc bl

	push cx
	mov cx,1d
	int 10h
	pop cx
	ret

printtriangle:
	mov byte [printchar], 42d
	call print
	mov byte [printchar], 47d
	inc byte [sy]
	dec byte [sx]
	call print
	mov byte [printchar], 92d
	add byte [sx], 2
	call print
	ret