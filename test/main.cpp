#include "pch.h"
#include "rand.h"
#include "util.h"
#include "sort.h"
#include "x64mem.h"
#include "char.h"
#include "binary.h"

using namespace std;


#include <map>

void __declspec(noinline) func(int a, int b, int c, int d) {
	func(a,b,d,c);
	cout << a;
}

#define USING_X_NAMESPACES using namespace x; using namespace x::util; using namespace x::x64

int main3() {
	USING_X_NAMESPACES;
	size_t size = 1 << 28;
	int* a = new int[size];
	int* b = new int[size];
	time::reset();
	memcpy(a, b, size*sizeof(int));
	time::println();

	time::reset();
	memcpy64(a, b, size/2);
	time::println();
	return 0;
}

void benchmarkMergesort(size_t size) {
	uint32_t* a = new uint32_t[size];
	uint32_t* buf = new uint32_t[size];
	for (int i = 0; i < size; ++i)
		a[i] = (uint32_t)x::x64::rand64();
	x::util::time::reset();
	x::x64::mergesort32(a, size, buf);
	x::util::time::println();

	for (int i = 0; i < size; ++i)
		a[i] = (uint32_t)x::x64::rand64();
	x::util::time::reset();
	std::sort(a, a + size);
	x::util::time::println();

	delete[] a;
	delete[] buf;
}

int count(int n, int part) {
	if (n < part)
		return 0;
	else if (n == part)
		return 1;
	else if (n % 2 == 0)
		return 2 * count(n / 2, part);
	else
		return count(n / 2, part) + count(n / 2 + 1, part);
}

void benchmarkSort3(size_t n) {
	uint32_t* a = new uint32_t[3 * n];
	uint32_t buf[3];
	for (int i = 0; i < 3*n; ++i)
		a[i] = (uint32_t)x::x64::rand64();
	std::cout << "x::mergesort32\n";
	x::util::time::reset();
	for (uint32_t* p = a, *end = a + 3*n; p < end; p+=3) 
		x::x64::mergesort32(p, 3, buf);	
	x::util::time::println();

	for (int i = 0; i < 3 * n; ++i)
		a[i] = (uint32_t)x::x64::rand64();
	x::util::time::reset();
	for (uint32_t* p = a, *end = a + 3 * n; p < end; p+=3) 
		x::x64::sort3(p);
	x::util::time::println();
	delete[] a;
}

#include <fstream>

_declspec(noinline) void d(int t, int k, int u, int o) {
	int g = u;
}

#include <regex>

string readFile(string filename) {
	ifstream in(filename);

	string content;
	if (in) {
		in.seekg(0, ios::end);
		content.resize(in.tellg());
		in.seekg(0, ios::beg);
		in.read(&content[0], content.size());
		in.close();
	}
	return content;
}

//int main() {
//	string file = readFile("D:\\VSProjects\\RegexEngineTester\\x64\\Debug\\RegexEngineTester.pdb");
//	ofstream out("C:\\Users\\user\\Desktop\\symbols.txt");
//	std::replace(file.begin(), file.end(), '\0', '\n');
//	auto cp = file.data();
//	std::regex r("\\?[\\w@]+@@[\\w@]+");
//	std::cmatch m;
//	while (std::regex_search(cp, m, r)) {
//		for (auto s : m) {
//			out << s << endl;
//			cout << s << endl;
//		}
//		cp = cp + m.position() + m.length();
//	}
//}

int main() {
	uint16_t t[10]{6, 7, 63, 56, 44, 6, 4, 56, 6, 1};
	bool buf[64]{0};
	size_t s = x::x64::unisort16_buf(t, 10, 64, buf);
	x::util::println(t, s);
}

int main222() {
	USING_X_NAMESPACES;
	size_t size = 256;
	size_t rep = 1000000;
	uint64_t* a = new uint64_t[size];
	time::reset();
	repeat(rep)
		memset(a, 0, size*8);
	std::cout << time::measure() << std::endl;

	time::reset();
	repeat(rep)
		memset64(a, 0, size);
	std::cout << time::measure() << std::endl;

	time::reset();
	repeat(rep)
		memset64str(a, 0, size);
	std::cout << time::measure() << std::endl;

	time::reset();
	repeat(rep)
		memset64_step(a, 0, size, 2);
	std::cout << time::measure() << std::endl;

	return 0;
}

int main111() {
	ofstream file("C:\\Users\\user\\Desktop\\f.txt");
	for (char c = 'a'; c <= 'z'; ++c)
		file << "'" << c << "', ";
	return 0;

	//int i, k;
	//scanf("%i,,%i", &i, &k);
	//return 0;

	//cout << count(1000000, 2);
	//return 0;

	//benchmarkMergesort(1000000);
	//return 0;

	//int a[4] = {1, 2, 3, 4};
	//int b[4];
	//

	////func(1, 2, 3, 4);
	using namespace x::util;
	using namespace x::x86;
	using namespace x::x64;
	//
	//memcpy64(b, a, 2);

	constexpr size_t size = 20;
	uint32_t t[size];// = {5, 6, 3};
	uint32_t buf[size]{0};
	for (int i = 0; i < size; ++i)
		t[i] = rand64r(100);
	println(t, size);
	mergesort32(t, size, buf);
	println(t, size);
	return 0;
}

int main1() {
	//x::I i;
	uint64_t a = 0x45B08E67AFDC1239ull;
	uint64_t b = 0x45B08E67AFDC1239ull;
	uint64_t c = a ^ 0x45B08E67AFDC1239ull;

	using namespace x::util;
	using namespace x::x86;
	using namespace x::x64;
	//cout << hex;
	//_priv::Initializer::initializer;

	std::mt19937_64 mt(std::random_device{}());
	std::uniform_real_distribution<double> dist(0.0, 1.0);

	time::reset();
	repeat(100000000)
		randd64();
	time::println();

	time::reset();
	repeat(100000000)
		dist(mt);
	time::println();

	return 0;

	int count = 0;
	auto t0 = clock();
	for (int i = 0; i < 100; ++i) {
		auto r = rand64r(4);
		cout << r << endl;
		/*if (r < 0x100000000000000)
			++count;*/
		//cout << r << endl;
	}
	auto t1 = clock();
	cout << float(t1 - t0) / CLOCKS_PER_SEC<<endl;
	//cout << count << endl;
	//uint32_t* data[8];
	//rand32a(data, 8);
	//print(data, 8);
	return 0;
}