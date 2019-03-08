.586
.xmm
.model flat, c
;option language: c
.stack 4096
option casemap:none

_A equ 0AFDC1239h
_B equ 5667FC17h


.data
	_result32 real4 0.0
	_result64 real8 0.0
	_seed32 dd 0
	_seed64 dq 0
.const
	_one32 real4 1.0
	_one64 real8 1.0

.code


genseed32 proc
	rdtsc
	ret
genseed32 endp


seed32 proc _value: dword
	mov eax, _value
	mov _seed32, eax
	ret
seed32 endp


rand32 proc
	mov eax, _seed32
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov _seed32, eax
	add eax, edx
	ret
rand32 endp


rand32r proc _range: dword
	mov eax, _seed32
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov _seed32, eax
	add eax, edx
	xor edx, edx
	div _range
	mov eax, edx
	ret
rand32r endp


rand32mm proc _min: dword, _max: dword
	mov eax, _seed32
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov _seed32, eax
	add eax, edx
	mov ebx, _max
	sub ebx, _min
	add ebx, 1
	xor edx, edx
	div ebx
	mov eax, edx
	add eax, _min
	ret
rand32mm endp


rand32mr proc _min: dword, _range: dword
	mov eax, _seed32
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov _seed32, eax
	add eax, edx
	xor edx, edx
	div _range
	mov eax, edx
	add eax, _min
	ret
rand32mr endp


rand32a proc _data: dword, _size: dword
	mov eax, _seed32
	mov ebx, _B
	mov edi, _data
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov _seed32, eax
	ret
rand32a endp


rand32ar proc _data: dword, _size: dword, _range: dword
	mov eax, _seed32
	mov ebx, _B
	mov edi, _data
	mov ecx, _range
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	xor edx, edx
	div ecx
	mov eax, edx
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov _seed32, eax
	ret
rand32ar endp


rand32amm proc _data: dword, _size: dword, _min: dword, _max: dword
	mov eax, _seed32
	mov ebx, _B
	mov edi, _data
	mov ecx, _max
	sub ecx, _min
	add ecx, 1
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	xor edx, edx
	div ecx
	mov eax, edx
	add eax, _min
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov _seed32, eax
	ret
rand32amm endp


rand32amr proc _data: dword, _size: dword, _min: dword, _range: dword
	mov eax, _seed32
	mov ebx, _B
	mov edi, _data
	mov ecx, _range
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	xor edx, edx
	div ecx
	mov eax, edx
	add eax, _min
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov _seed32, eax
	ret
rand32amr endp


rand32s proc _pseed: dword
	mov ecx, _pseed
	mov eax, [ecx]
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov [ecx], eax
	add eax, edx
	ret
rand32s endp


rand32sr proc _pseed: dword, _range: dword
	mov ecx, _pseed
	mov eax, [ecx]
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov [ecx], eax
	add eax, edx
	xor edx, edx
	div _range
	ret
rand32sr endp


rand32smm proc _pseed: dword, _min: dword, _max: dword
	mov ecx, _pseed
	mov eax, [ecx]
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov [ecx], eax
	mov ebx, _max
	sub ebx, _min
	add ebx, 1
	add eax, edx
	xor edx, edx
	div ebx
	mov eax, edx
	add eax, _min
	ret
rand32smm endp


rand32smr proc _pseed: dword, _min: dword, _range: dword
	mov ecx, _pseed
	mov eax, [ecx]
	mov eax, _seed32
	xor eax, _A
	mov ebx, _B
	mul ebx
	mov [ecx], eax
	add eax, edx
	xor edx, edx
	div _range
	mov eax, edx
	add eax, _min
	ret
rand32smr endp


randf32 proc
	;push ebp
	;mov ebp, esp
	;lea ecx, _seed32
	;jmp _RANDF32S_BEGIN
	mov eax, _seed32
	xor eax, _A
	mov ebx, _B
	mul ebx
	; add eax, edx
	and eax, 007FFFFFh
	or eax, 3F800000h
	mov _seed32, eax
	mov _result32, eax
	movss xmm0, _result32
	subss xmm0, _one32
	movss _result32, xmm0
	fld _result32
	ret
randf32 endp


randf32s proc _pseed: dword
	mov ecx, _pseed
;_RANDF32S_BEGIN::
	mov eax, [ecx]
	xor eax, _A
	mov ebx, _B
	mul ebx
	; add eax, edx
	and eax, 007FFFFFh
	or eax, 3F800000h
	mov [ecx], eax
	mov _result32, eax
	movss xmm0, _result32
	subss xmm0, _one32
	movss _result32, xmm0
	fld _result32
	ret
randf32s endp


randd32 proc
	mov eax, _seed32
	xor eax, _A
	mov ebx, _B
	mul ebx
	; add eax, edx
	and eax, 000FFFFFh
	or eax, 3FF00000h
	mov dword ptr[_result64 + 4], eax
	xor eax, _A
	mul ebx
	; add eax, edx
	mov dword ptr[_result64], eax
	mov _seed32, eax	
	movsd xmm0, _result64
	subsd xmm0, _one64
	movsd _result64, xmm0
	fld _result64
	ret
randd32 endp


randd32s proc _pseed: dword
	mov ecx, _pseed
	mov eax, [ecx]
	xor eax, _A
	mov ebx, _B
	mul ebx
	; add eax, edx
	and eax, 000FFFFFh
	or eax, 3FF00000h
	mov dword ptr[_result64], eax
	xor eax, _A
	mul ebx
	; add eax, edx
	mov dword ptr[_result64 + 4], eax
	mov [ecx], eax	
	movsd xmm0, _result64
	subsd xmm0, _one64
	movsd _result64, xmm0
	fld _result64
	ret
randd32s endp


rand32as proc _data: dword, _size: dword, _pseed: dword
	mov ecx, _pseed
	mov eax, [ecx]
	mov ebx, _B
	mov edi, _data
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov [ecx], eax
	ret
rand32as endp


rand32asr proc _data: dword, _size: dword, _range: dword, _pseed: dword
	mov ecx, _pseed
	mov eax, [ecx]
	mov ebx, _B
	mov edi, _data
	mov ecx, _range
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	xor edx, edx
	div ecx
	mov eax, edx
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov ecx, _pseed
	mov [ecx], eax
	ret
rand32asr endp


rand32asmm proc _data: dword, _size: dword, _min: dword, _max: dword, _pseed: dword
	mov ecx, _pseed
	mov eax, [ecx]
	mov ebx, _B
	mov edi, _data
	mov ecx, _max
	sub ecx, _min
	add ecx, 1
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	xor edx, edx
	div ecx
	mov eax, edx
	add eax, _min
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov ecx, _pseed
	mov [ecx], eax
	ret
rand32asmm endp


rand32asmr proc _data: dword, _size: dword, _min: dword, _range: dword, _pseed: dword
	mov ecx, _pseed
	mov eax, [ecx]
	mov ebx, _B
	mov edi, _data
	mov ecx, _range
	mov esi, _size
	shl esi, 2
	add esi, edi
	LOOP_BEGIN:
	cmp edi, esi
	je LOOP_END
	xor eax, _A
	mul ebx
	add eax, edx
	xor edx, edx
	div ecx
	mov eax, edx
	add eax, _min
	mov [edi], eax
	add edi, 4
	jmp LOOP_BEGIN
	LOOP_END:
	mov _seed32, eax
	ret
rand32asmr endp

end
