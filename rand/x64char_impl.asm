option casemap:none

.code

map_cb proc
	xor rcx, rcx
	mov al, [rdx]
	cmp al, 0
	je RETURN
LOOP_BEGIN:
	mov byte ptr[rcx + rax], 1
	mov al, [rdx]
	cmp al, 0
	jne LOOP_BEGIN
RETURN:
	ret
map_cb endp

?f@C@@QEAAHXZ proc ;C::f()
	mov rax, 2
	ret
?f@C@@QEAAHXZ endp

end