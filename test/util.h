#pragma once


namespace x::util
{
	template<class _Type, class _Sep>
	void print(_Type const* a, size_t size, _Sep&& sep) {
		if (size > 0) {
			_Type const* end = a + size;
			std::cout << *a++;
			while (a < end)
				std::cout << (_Sep&&)sep << *a++;
		}
	}

	template<class _Type, class _Sep>
	void println(_Type const* a, size_t size, _Sep&& sep) {
		print(a, size, (_Sep&&)sep);
		std::cout << "\n";
	}

	template<class _Type>
	__forceinline void print(_Type const* a, size_t size) {
		print(a, size, ' ');
	}

	template<class _Type>
	__forceinline void println(_Type const* a, size_t size) {
		print(a, size, ' ');
		std::cout << "\n";
	}

	extern std::chrono::microseconds _time0;

	namespace time 
	{
		__inline void reset() {
			using namespace std::chrono;
			_time0 = duration_cast<microseconds>(system_clock::now().time_since_epoch());
		}

		__inline float measure() {
			using namespace std::chrono;
			return float((duration_cast<microseconds>(system_clock::now().time_since_epoch()) - _time0).count()) *0.000001f;
		}

		__inline void print() {
			printf("%f", measure());
		}

		__inline void println() {
			printf("%f\n", measure());
		}
	}
}

#define repeat(_n) for (auto _i_ = static_cast<decltype(_n)>(0); _i_ < _n; ++_i_)