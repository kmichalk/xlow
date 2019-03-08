#include "x64rand.h"

#include <iostream>

x::x64::_priv::Initializer::Initializer() {
	seed64(genseed64());
}
