option casemap: none

.code

$begin equ [rsp + 8]
$mid equ [rsp + 16]
$end equ [rsp + 24]

;mergesort32impl proc
;	mov rbx, rdx
;	sub rbx, rcx
;	cmp rbx, 8
;	jg SIZE_GT_2
;		mov eax, [rcx]
;		mov ebx, [rdx-4]
;		cmp eax, ebx
;		jle RETURN;
;			mov [rdx-4], eax
;			mov [rcx], ebx
;		jmp RETURN;		
;SIZE_GT_2:
;	sub rsp, 32
;	mov $end, rdx
;	mov $begin, rcx
;	add rdx, rcx
;	shr rdx, 1
;	and dl, 11111100b
;	mov $mid, rdx
;LEFT_PART:
;	mov rbx, rdx
;	sub rbx, rcx
;	cmp rbx, 4
;	jle RIGHT_PART
;		call mergesort32impl
;RIGHT_PART:
;	mov rcx, $mid
;	mov rdx, $end
;	mov rbx, rdx
;	sub rbx, rcx
;	cmp rbx, 4
;	jle MERGE
;		call mergesort32impl
;MERGE:
;	mov r10, $begin 	
;	mov r11, $mid
;	mov r12, r11
;	mov r13, $end
;	mov r14, r8
;LOOP_BEGIN:
;	mov eax, dword ptr[r10]
;	mov ebx, dword ptr[r12]
;	cmp eax, ebx
;	jge TAKE_RIGHT
;	TAKE_LEFT:
;		mov [r14], eax
;		add r10, 4
;		add r14, 4
;		cmp r10, r11
;		jge COPY_RIGHT
;		jmp LOOP_BEGIN
;	TAKE_RIGHT:
;		mov [r14], ebx
;		add r12, 4
;		add r14, 4
;		cmp r12, r13
;		jge COPY_LEFT
;		jmp LOOP_BEGIN
;COPY_LEFT: 
;	mov rcx, r11
;	sub rcx, r10
;	mov rdi, $end
;	sub rdi, rcx
;	shr rcx, 2
;	mov rsi, r10
;	rep movsd
;	mov rdi, $begin
;	mov rsi, r8
;	mov rcx, r14
;	sub rcx, r8
;	shr rcx, 2
;	rep movsd
;COPY_RIGHT:
;	mov rdi, $begin
;	mov rsi, r8
;	mov rcx, r14
;	sub rcx, r8
;	shr rcx, 2
;	rep movsd
;FUNCEND:
;	add rsp, 32
;RETURN:
;	ret
;mergesort32impl endp

sort3 proc
	mov r13d, dword ptr[rcx]
	mov r14d, dword ptr[rcx+4]
	mov r15d, dword ptr[rcx+8]
	cmp r13d, r14d
	jg A_g_B
		cmp r14d, r15d
		jle RETURN
			cmp r13d, r15d
			jg CAB
			ACB:
				mov [rcx+4], r15d
				mov [rcx+8], r14d
				ret
			CAB:
				mov [rcx], r15d
				mov [rcx+4], r13d
				mov [rcx+8], r14d
				ret
	A_g_B:
		cmp r14d, r15d
		jg CBA
			cmp r13d, r15d
			jg BCA
			BAC:
				mov [rcx], r14d
				mov [rcx+4], r13d
				mov [rcx+8], r15d
				ret
			BCA:
				mov [rcx], r14d
				mov [rcx+4], r15d
				mov [rcx+8], r13d
				ret
		CBA:
			mov [rcx], r15d
			mov [rcx+4], r14d
			mov [rcx+8], r13d
	RETURN:
	ret
sort3 endp

;//////////////////////////////////////////////////////////////////

mergesort32impl proc
	mov rbx, rdx
	sub rbx, rcx
	cmp rbx, 8
	jg SIZE_GT_2
		mov eax, dword ptr[rcx]
		mov ebx, dword ptr[rcx+4]
		cmp eax, ebx
		jle RETURN
			mov dword ptr[rcx+4], eax
			mov dword ptr[rcx], ebx
		ret
SIZE_GT_2:
	cmp rbx, 12
	jg SIZE_GT_3
		call sort3
		ret
SIZE_GT_3:
	sub rsp, 32
	mov $end, rdx
	mov $begin, rcx
	add rdx, rcx
	shr rdx, 1
	and dl, 11111100b
	mov $mid, rdx
LEFT_PART:
	mov rbx, rdx
	sub rbx, rcx
	cmp rbx, 4
	jle RIGHT_PART
		call mergesort32impl
RIGHT_PART:
	mov rcx, $mid
	mov rdx, $end
	mov rbx, rdx
	sub rbx, rcx
	cmp rbx, 4
	jle MERGE
		call mergesort32impl
MERGE:
	mov r10, $begin 	
	mov r11, $mid
	mov r12, r11
	mov r13, $end
	mov r14, r8
	mov eax, dword ptr[r10]
	mov ebx, dword ptr[r12]
LOOP_BEGIN:
	cmp eax, ebx
	jge TAKE_RIGHT
	TAKE_LEFT:
		mov [r14], eax
		add r10, 4
		add r14, 4
		cmp r10, r11
		jge COPY_RIGHT
			mov eax, dword ptr[r10]
			jmp LOOP_BEGIN
	TAKE_RIGHT:
		mov [r14], ebx
		add r12, 4
		add r14, 4
		cmp r12, r13
		jge COPY_LEFT
		mov ebx, dword ptr[r12]
			jmp LOOP_BEGIN
COPY_LEFT: 
	mov rcx, r11
	sub rcx, r10
	mov rdi, $end
	sub rdi, rcx
	shr rcx, 2
	mov rsi, r10
	rep movsd
	mov rdi, $begin
	mov rsi, r8
	mov rcx, r14
	sub rcx, r8
	shr rcx, 2
	rep movsd
COPY_RIGHT:
	mov rdi, $begin
	mov rsi, r8
	mov rcx, r14
	sub rcx, r8
	shr rcx, 2
	rep movsd
FUNCEND:
	add rsp, 32
RETURN:
	ret
mergesort32impl endp

;//////////////////////////////////////////////////////////////////

mergesort32 proc
	cmp rdx, 0
	je RETURN
		shl rdx, 2
		add rdx, rcx
		call mergesort32impl
	RETURN:
	ret
mergesort32 endp

;//////////////////////////////////////////////////////////////////

unisort16_buf proc
	mov r11, rcx
	mov r10, rcx
	shl rdx, 1
	add r10, rdx
	cmp rcx, r10
	jge RETURN_0
	xor rax, rax
LOOP_BEGIN:
	mov ax, [rcx]
	mov byte ptr[r9+rax], 1
	add rcx, 2
	cmp rcx, r10
	jl LOOP_BEGIN
COLLECT:
	mov rbx, 0
	mov rax, r11
COLLECT_LOOP_BEGIN:
	cmp byte ptr[r9+rbx], 0
	je NEXT_VALUE
		mov [rax], bx
		add rax, 2
NEXT_VALUE:
	add rbx, 1
	cmp bx, r8w
	jl COLLECT_LOOP_BEGIN
RETURN:
	sub rax, r11
	shr rax, 1
	ret
RETURN_0:
	xor rax, rax
	ret
unisort16_buf endp

end
