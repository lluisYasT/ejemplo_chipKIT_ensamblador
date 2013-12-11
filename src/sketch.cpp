#include <WProgram.h>

// Se incluye "C" para evitar el 'name mangling' de C++
extern "C" int leaf_example(int, int, int, int);
extern "C" uint32_t return_pc();

void setup()
{
	Serial.begin(9600);
	Serial.println(return_pc());
	int res = leaf_example(3,4,5,6);
	Serial.println(res,DEC);
	res = leaf_example(6,5,4,3);
	Serial.println(res,DEC);
	Serial.println(return_pc());
}

void loop()
{
}
