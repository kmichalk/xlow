#pragma once

#include <cstdint>

namespace x
{
	namespace x64
	{
		extern "C" uint64_t genseed64();
		extern "C" void __cdecl seed64(uint64_t value);

		extern "C" uint64_t __cdecl rand64();
		extern "C" uint64_t __cdecl rand64r(uint64_t range);
		extern "C" uint64_t __cdecl rand64mm(uint64_t min, uint64_t max);
		extern "C" uint64_t __cdecl rand64mr(uint64_t min, uint64_t range);

		extern "C" void __cdecl rand64a(void* data, size_t size);
		extern "C" void __cdecl rand64ar(void* data, size_t size, uint64_t range);
		extern "C" void __cdecl rand64amm(void* data, size_t size, uint64_t min, uint64_t max);
		extern "C" void __cdecl rand64amr(void* data, size_t size, uint64_t min, uint64_t range);

		extern "C" uint64_t __cdecl rand64s(uint64_t* pseed);
		extern "C" uint64_t __cdecl rand64sr(uint64_t* pseed, uint64_t range);
		extern "C" uint64_t __cdecl rand64smm(uint64_t* pseed, uint64_t min, uint64_t max);
		extern "C" uint64_t __cdecl rand64smr(uint64_t* pseed, uint64_t min, uint64_t range);

		extern "C" void __cdecl rand64as(void* data, size_t size, uint64_t* pseed);
		extern "C" void __cdecl rand64asr(void* data, size_t size, uint64_t* pseed, uint64_t range);
		extern "C" void __cdecl rand64asmm(void* data, size_t size, uint64_t* pseed, uint64_t min, uint64_t max);
		extern "C" void __cdecl rand64asmr(void* data, size_t size, uint64_t* pseed, uint64_t min, uint64_t range);

		extern "C" float __cdecl randf64();
		extern "C" float __cdecl randf64s(uint64_t* pseed);

		extern "C" double __cdecl randd64();
		extern "C" double __cdecl randd64_32();
		extern "C" double __cdecl randd64s(uint64_t* pseed);

		namespace _priv
		{
			class Initializer {
			public:
				Initializer();
			};

			inline static Initializer volatile initializer;
		}
	}
}
