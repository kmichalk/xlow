;_586
;_xmm
;_model flat, c
;_stack 4096

option casemap: none

.data
	_result64		real8	0.0
	_seed64			qword	0
.const
	_one32			real4	1.0
	_one64			real8	1.0
	_A				qword	45B08E67AFDC1239h
	_B				qword	5667FC175667FC17h
	_floatMantMask	qword	00000000007FFFFFh
	_floatExpMask	qword	000000003F800000h
	_doubleMantMask	qword	000FFFFFFFFFFFFFh
	_doubleExpMask	qword	3FF0000000000000h
.code


genseed64 proc
	rdtsc
	ret
genseed64 endp


seed64 proc
	mov _seed64, rcx
	ret
seed64 endp


rand64 proc
	mov rax, _seed64
	xor rax, _A
	mul _B
	mov _seed64, rax
	xor rax, rdx
	ret
rand64 endp


rand64r proc
	mov rax, _seed64
	xor rax, _A
	mul _B
	mov _seed64, rax
	xor rax, rdx
	xor rdx, rdx
	div rcx
	mov rax, rdx
	ret
rand64r endp


rand64mm proc
	sub rdx, rcx
	add rdx, 1
	mov rbx, rdx
	mov rax, _seed64
	xor rax, _A
	mul _B
	mov _seed64, rax
	xor rax, rdx
	xor rdx, rdx
	div rbx
	mov rax, rdx
	add rax, rcx
	ret
rand64mm endp


rand64mr proc
	mov rbx, rdx
	mov rax, _seed64
	xor rax, _A
	mul _B
	mov _seed64, rax
	xor rax, rdx
	xor rdx, rdx
	div rbx
	mov rax, rdx
	add rax, rcx
	ret
rand64mr endp


rand64s proc
	mov rax, [rcx]
	xor rax, _A
	mul _B
	mov [rcx], rax
	xor rax, rdx
	ret
rand64s endp


rand64sr proc
	mov rbx, rdx
	mov rax, [rcx]
	xor rax, _A
	mul _B
	mov [rcx], rax
	xor rax, rdx
	xor rdx, rdx
	div rbx
	mov rax, rdx
	ret
rand64sr endp


rand64smm proc
	sub r8, rdx
	add r8, 1
	mov rbx, rdx
	mov rax, [rcx]
	xor rax, _A
	mul _B
	mov [rcx], rax
	xor rax, rdx
	xor rdx, rdx
	div r8
	mov rax, rdx
	add rax, rbx
	ret
rand64smm endp


rand64smr proc
	mov rbx, rdx
	mov rax, [rcx]
	xor rax, _A
	mul _B
	mov [rcx], rax
	xor rax, rdx
	xor rdx, rdx
	div r8
	mov rax, rdx
	add rax, rbx
	ret
rand64smr endp



randf64 proc
	mov rax, _seed64
	xor rax, _A
	mul _B
	mov _seed64, rax
	add rax, rdx
	and rax, _floatMantMask
	or rax, _floatExpMask
	movd xmm0, eax
	subss xmm0, _one32
	ret
randf64 endp


randf64s proc
	mov rax, [rcx]
	xor rax, _A
	mul _B
	mov [rcx], rax
	add rax, rdx
	and rax, _floatMantMask
	or rax, _floatExpMask
	movd xmm0, eax
	subss xmm0, _one32
	ret
randf64s endp


randd64 proc
	mov rax, _seed64
	xor rax, _A
	mul _B
	mov _seed64, rax
	add rax, rdx
	and rax, _doubleMantMask
	or rax, _doubleExpMask
	movq xmm0, rax
	subsd xmm0, _one64
	ret
randd64 endp


randd64_32 proc
	mov rax, _seed64
	xor eax, dword ptr[_A]
	mul dword ptr[_B]
	; add eax, edx
	and eax, 000FFFFFh
	or eax, 3FF00000h
	mov dword ptr[_result64 + 4], eax
	xor eax, dword ptr[_A]
	mul dword ptr[_B]
	; add eax, edx
	mov dword ptr[_result64], eax
	mov _seed64, rax	
	movsd xmm0, _result64
	subsd xmm0, _one64
	ret
randd64_32 endp


randd64s proc
	mov rax, [ecx]
	xor rax, _A
	mul _B
	mov [ecx], rax
	add rax, rdx
	and rax, _doubleMantMask
	or rax, _doubleExpMask
	movq xmm0, rax
	subsd xmm0, _one64
	ret
randd64s endp

end
