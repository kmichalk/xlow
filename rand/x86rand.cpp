#include "x86rand.h"

namespace x::x86
{
	class Initializer {
	public:
		Initializer() {
			seed32(genseed32());
		}
	};

	Initializer initializer;
}