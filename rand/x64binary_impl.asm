option casemap: none

.code

;b_or64 proc
;	shl r8, 3
;	mov r10, rcx
;	add r10, r8
;LOOP_BEGIN:
;	cmp rcx, r10
;	jge RETURN
;		mov rax, [rcx]
;		or [rdx], rax
;		add rcx, 8
;		add rdx, 8
;	jmp LOOP_BEGIN
;RETURN:
;	ret
;b_or64 endp

b_or64 proc
	shl r8, 3
	mov r10, rcx
	add r10, r8
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:	
		mov rax, [rcx]
		or [rdx], rax
		add rcx, 8
		add rdx, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_or64 endp

;//////////////////////////////////////////////////////////////////

b_xor64 proc
	shl r8, 3
	mov r10, rcx
	add r10, r8
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:	
		mov rax, [rcx]
		xor [rdx], rax
		add rcx, 8
		add rdx, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_xor64 endp

;//////////////////////////////////////////////////////////////////

b_and64 proc
	shl r8, 3
	mov r10, rcx
	add r10, r8
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:	
		mov rax, [rcx]
		and [rdx], rax
		add rcx, 8
		add rdx, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_and64 endp

;//////////////////////////////////////////////////////////////////

b_not64 proc
	shl r8, 3
	mov r10, rcx
	add r10, rdx
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:
		not qword ptr[rcx]
		add rcx, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_not64 endp

;//////////////////////////////////////////////////////////////////

b_or64d proc
	shl r9, 3
	mov r10, rcx
	add r10, r9
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:
		mov rax, [rdx]
		or rax, [r8]
		mov [rcx], rax
		add rcx, 8
		add rdx, 8
		add r8, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_or64d endp

;//////////////////////////////////////////////////////////////////

b_xor64d proc
shl r9, 3
	mov r10, rcx
	add r10, r9
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:
		mov rax, [rdx]
		xor rax, [r8]
		mov [rcx], rax
		add rcx, 8
		add rdx, 8
		add r8, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_xor64d endp

;//////////////////////////////////////////////////////////////////

b_and64d proc
	shl r9, 3
	mov r10, rcx
	add r10, r9
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:
		mov rax, [rdx]
		and rax, [r8]
		mov [rcx], rax
		add rcx, 8
		add rdx, 8
		add r8, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_and64d endp

;//////////////////////////////////////////////////////////////////

b_not64d proc
	shl r8, 3
	mov r10, rcx
	add r10, r8
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:
		mov rax, [rdx]
		not rax
		mov [rcx], rax
		add rcx, 8
		add rdx, 8
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
b_not64d endp

end