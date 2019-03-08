#pragma once

namespace x 
{
	namespace x64
	{
		/// <summary>
		/// Performs bitwise or on 2 memory blocks with precision of 64 bits.
		/// Saves result in the left operand block.
		/// </summary>
		/// <param name="a">The left operand and destination</param>
		/// <param name="b">The right operand</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_or64(void* a, void* b, size_t size);

		/// <summary>
		/// Performs bitwise xor on 2 memory blocks with precision of 64 bits.
		/// Saves result in the left operand block.
		/// </summary>
		/// <param name="a">The left operand and destination</param>
		/// <param name="b">The right operand</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_xor64(void* a, void* b, size_t size);

		/// <summary>
		/// Performs bitwise and on 2 memory blocks with precision of 64 bits.
		/// Saves result in the left operand block.
		/// </summary>
		/// <param name="a">The left operand and destination</param>
		/// <param name="b">The right operand</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_and64(void* a, void* b, size_t size);

		/// <summary>
		/// Performs bitwise not on a memory block with precision of 64 bits.
		/// Saves result in the operand block.
		/// </summary>
		/// <param name="a">The operand and destination</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_not64(void* a, size_t size);

		/// <summary>
		/// Performs bitwise or on 2 memory blocks with precision of 64 bits.
		/// Saves result in the destination block.
		/// </summary>
		/// <param name="dest">The destination of result</param>
		/// <param name="a">The left operand</param>
		/// <param name="b">The right operand</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_or64d(void* dest, void* a, void* b, size_t size);

		/// <summary>
		/// Performs bitwise xor on 2 memory blocks with precision of 64 bits.
		/// Saves result in the destination block.
		/// </summary>
		/// <param name="dest">The destination of result</param>
		/// <param name="a">The left operand</param>
		/// <param name="b">The right operand</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_xor64d(void* dest, void* a, void* b, size_t size);

		/// <summary>
		/// Performs bitwise and on 2 memory blocks with precision of 64 bits.
		/// Saves result in the destination block.
		/// </summary>
		/// <param name="dest">The destination of result</param>
		/// <param name="a">The left operand</param>
		/// <param name="b">The right operand</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_and64d(void* dest, void* a, void* b, size_t size);

		/// <summary>
		/// Performs bitwise not on a memory block with precision of 64 bits.
		/// Saves result in the destination block.
		/// </summary>
		/// <param name="dest">The destination of result</param>
		/// <param name="a">The operand</param>
		/// <param name="size">The number of 64-bit chunks to be processed</param>
		extern "C" void __cdecl b_not64d(void* dest, void* a, size_t size);
	}
}
