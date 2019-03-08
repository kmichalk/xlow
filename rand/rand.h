#pragma once

#include "x86rand.h"

#ifdef _M_X64
#include "x64rand.h"
#define _rand32impl x86::rand32
#define _rand64impl x64::rand64
#else
#define _rand32impl x86::rand32
#define _rand64impl x86::rand64
#endif

namespace x {
	template<typename _Type>
	__forceinline _Type rand() {
		return static_cast<_Type>(x86::rand32());
	}

	/*__forceinline char __cdecl randc() {
		return static_cast<char>(_rand32impl());
	}

	__forceinline unsigned char __cdecl randuc() {
		return static_cast<unsigned char>(_rand32impl());
	}

	__forceinline short __cdecl rands() {
		return static_cast<short>(_rand32impl());
	}

	__forceinline unsigned short __cdecl randus() {
		return static_cast<unsigned short>(_rand32impl());
	}

	__forceinline long __cdecl randl() {
		return static_cast<long>(_rand32impl());
	}

	__forceinline unsigned long __cdecl randul() {
		return static_cast<unsigned long>(_rand32impl());
	}

	__forceinline long long __cdecl randll() {
		return static_cast<long long>(_rand64impl());
	}

	__forceinline unsigned long long __cdecl randull() {
		return static_cast<unsigned long long>(_rand64impl());
	}*/
}
