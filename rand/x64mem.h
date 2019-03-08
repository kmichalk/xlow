#pragma once

namespace x
{
	namespace x64
	{
		extern "C" void __cdecl memcpy32(void* dest, void* src, size_t size);
		extern "C" void __cdecl memcpy64(void* dest, void* src, size_t size);
		extern "C" void __cdecl memset64(void* dest, uint64_t value, size_t size);
		extern "C" void __cdecl memset64str(void* dest, uint64_t value, size_t size);
		extern "C" void __cdecl memset8_step(void* dest, uint8_t value, size_t size, size_t step);
		extern "C" void __cdecl memset16_step(void* dest, uint16_t value, size_t size, size_t step);
		extern "C" void __cdecl memset32_step(void* dest, uint32_t value, size_t size, size_t step);
		extern "C" void __cdecl memset64_step(void* dest, uint64_t value, size_t size, size_t step);
		//extern "C" void __cdecl memfind8(void* data, size_t size, uin);
	}
}