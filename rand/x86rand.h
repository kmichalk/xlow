#pragma once

#include <cstdint>

namespace x
{
	namespace x86
	{
		inline namespace _
		{
			extern "C" uint32_t genseed32();
			extern "C" void __cdecl seed32(uint32_t value);

			extern "C" uint32_t __cdecl rand32();
			extern "C" uint32_t __cdecl rand32r(uint32_t range);
			extern "C" uint32_t __cdecl rand32mm(uint32_t min, uint32_t max);
			extern "C" uint32_t __cdecl rand32mr(uint32_t min, uint32_t range);

			extern "C" void __cdecl rand32a(void* data, size_t size);
			extern "C" void __cdecl rand32ar(void* data, size_t size, uint32_t range);
			extern "C" void __cdecl rand32amm(void* data, size_t size, uint32_t min, uint32_t max);
			extern "C" void __cdecl rand32amr(void* data, size_t size, uint32_t min, uint32_t range);

			extern "C" uint32_t __cdecl rand32s(uint32_t* pseed);
			extern "C" uint32_t __cdecl rand32sr(uint32_t* pseed, uint32_t range);
			extern "C" uint32_t __cdecl rand32smm(uint32_t* pseed, uint32_t min, uint32_t max);
			extern "C" uint32_t __cdecl rand32smr(uint32_t* pseed, uint32_t min, uint32_t range);

			extern "C" void __cdecl rand32as(void* data, size_t size, uint32_t* pseed);
			extern "C" void __cdecl rand32asr(void* data, size_t size, uint32_t* pseed, uint32_t range);
			extern "C" void __cdecl rand32asmm(void* data, size_t size, uint32_t* pseed, uint32_t min, uint32_t max);
			extern "C" void __cdecl rand32asmr(void* data, size_t size, uint32_t* pseed, uint32_t min, uint32_t range);

			extern "C" float __cdecl randf32();
			extern "C" float __cdecl randf32s(uint32_t* pseed);

			extern "C" double __cdecl randd32();
			extern "C" double __cdecl randd32s(uint32_t* pseed);
		}
	}
	

	/*class Random
	{
		mutable uint32_t _seed;
		
	public:
		Random():
			_seed(x86::genseed32())
		{ }

		__forceinline void seed(uint32_t value) {
			_seed = value;
		}

		__forceinline uint32_t next() const {
			return x86::rand32s(&_seed);
		}

		__forceinline uint32_t next(uint32_t range) const {
			return x86::rand32sr(&_seed, range);
		}

		__forceinline uint32_t next(uint32_t min, uint32_t range) const {
			return x86::rand32smr(&_seed, min, range);
		}
	};*/

	
	/*long __cdecl randl(){return }
	unsigned long __cdecl randul();
	short __cdecl rands();
	unsigned short __cdecl randus();
	char __cdecl randc();
	unsigned char __cdecl randuc();
	long long __cdecl randll();
	unsigned long long __cdecl randull();*/

}
