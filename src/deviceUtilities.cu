#include <iostream>

using namespace std;

void queryDeviceInformation(void) {
	cudaDeviceProp prop;

	int count;
	cudaGetDeviceCount(&count);

	for (int i=0; i< count; i++) {

		cudaGetDeviceProperties(&prop, i);

		cout << "--- General Information for device " << i << endl << endl;

		cout << "Name: " << prop.name << endl;
		cout << "Compute capability: " << prop.major << "." << prop.minor << endl;
		cout << "Clock rate: " << prop.clockRate << endl;

		cout << "Device copy overlap: ";
			if (prop.deviceOverlap)
				cout << "Enabled " << endl;
			else
				cout << "Disabled" << endl;

		cout << "Kernel execution timeout: ";
			if (prop.kernelExecTimeoutEnabled)
				cout << "Enabled " << endl;
			else
				cout << "Disabled" << endl;

		cout << endl;
		cout << "--- Memory Information for device " << i << endl << endl;

		cout << "Total global memory: " << prop.totalGlobalMem << endl;
		cout << "Total constant memory: " << prop.totalConstMem << endl;
		cout << "Max mem pitch: " << prop.memPitch << endl;
		cout << "Texture Alignment: " << prop.textureAlignment << endl;
	}
}
