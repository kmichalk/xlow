option casemap: none

.code

memcpy32 proc
	mov rdi, rcx
	mov rsi, rdx
	mov rcx, r8
	rep movsd
	ret
memcpy32 endp


memcpy64 proc
	mov rdi, rcx
	mov rsi, rdx
	mov rcx, r8
	rep movsq
	ret
memcpy64 endp


memset64 proc
	mov r9, rcx
	shl r8, 3
	add r9, r8
	cmp rcx, r9
	jge RETURN
LOOP_BEGIN:
	mov [rcx], rdx
	add rcx, 8
	cmp rcx, r9
	jl LOOP_BEGIN
RETURN:
	ret
memset64 endp


memset64str proc
	mov rdi, rcx
	mov rcx, r8
	mov rax, rdx
	rep stosq
	ret
memset64str endp


memset8_step proc
	mov r10, rcx
	add r10, r8
	cmp rcx, r10
	jge RETURN
LOOP_BEGIN:
	mov [rcx], dl
	add rcx, r9
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
memset8_step endp


memset16_step proc
	mov r10, rcx
	shl r8, 1
	add r10, r8
	cmp rcx, r10
	jge RETURN
	shl r9, 1
LOOP_BEGIN:
	mov [rcx], dx
	add rcx, r9
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
memset16_step endp


memset32_step proc
	mov r10, rcx
	shl r8, 2
	add r10, r8
	cmp rcx, r10
	jge RETURN
	shl r9, 2
LOOP_BEGIN:
	mov [rcx], edx
	add rcx, r9
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
memset32_step endp


memset64_step proc
	mov r10, rcx
	shl r8, 3
	add r10, r8
	cmp rcx, r10
	jge RETURN
	shl r9, 3
LOOP_BEGIN:
	mov [rcx], rdx
	add rcx, r9
	cmp rcx, r10
	jl LOOP_BEGIN
RETURN:
	ret
memset64_step endp

end