#pragma once

#include <cstdint>

namespace x
{
	namespace x64
	{
		extern "C" void __cdecl sort3(uint32_t* data);
		extern "C" void __cdecl mergesort32(uint32_t* data, size_t size, uint32_t* buffer);
		//extern "C" void __cdecl unisort16r(uint16_t* data, size_t size, uint16_t range);
		extern "C" size_t __cdecl unisort16_buf(uint16_t* data, size_t size, uint16_t range, bool* buf);
	}
}
