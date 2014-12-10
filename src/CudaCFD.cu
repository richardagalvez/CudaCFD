#include <iostream>

using namespace std;

int main(void) {
	cudaDeviceProp prop;

	int count;
	cudaGetDeviceCount(&count);

	cout << "The number of CUDA devices is " << count << endl;
}
