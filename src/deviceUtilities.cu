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

		cout << endl;
		cout << "--- MP Information for device " << i << endl << endl;

		cout << "Multiprocessor count: " << prop.multiProcessorCount << endl;
		cout << "Shared memory per block: " << prop.sharedMemPerBlock << endl;
		cout << "Registers per block: " << prop.regsPerBlock << endl;
		cout << "Threads in warp: " << prop.warpSize << endl;
		cout << "Max threads per block: " << prop.maxThreadsPerBlock << endl;
		cout << "Max thread dimensions: " << prop.maxThreadsDim[0] << ", "
			 << prop.maxThreadsDim[1] << ", " << prop.maxThreadsDim[2] << endl;
		cout << "Max grid dimensions: " << prop.maxGridSize[0] << ", "
					 << prop.maxGridSize[1] << ", " << prop.maxGridSize[2] << endl;

	}
}
