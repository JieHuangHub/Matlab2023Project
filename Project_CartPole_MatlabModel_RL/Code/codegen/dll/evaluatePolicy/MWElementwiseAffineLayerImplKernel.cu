#include "MWKernelHeaders.hpp"
#include <math.h>
#include <stdio.h>
 void __global__ __launch_bounds__(1024) scale_scalar_kernel(const float* 
inputBuffer, float* outputBuffer, float* olKGEIcsxmLSoMhRhEtP, long int 
YGiQICncmsGZkNUyiQyg) { for (long int idx = blockDim.x * blockIdx.x + 
threadIdx.x; idx < YGiQICncmsGZkNUyiQyg; idx += blockDim.x * gridDim.x) { 
outputBuffer[idx] = olKGEIcsxmLSoMhRhEtP[0] * inputBuffer[idx]; } } void __global__ 
__launch_bounds__(1024) scale_vector_kernel(const float* inputBuffer, float* 
outputBuffer, float* olKGEIcsxmLSoMhRhEtP, double YNDVziqpDddiXQKYZZhX, 
double YMNbgnUYZspjMLjwcIOS, long int YGiQICncmsGZkNUyiQyg) { for (long 
int idx = blockDim.x * blockIdx.x + threadIdx.x; idx < YGiQICncmsGZkNUyiQyg; 
idx += blockDim.x * gridDim.x) { double batchIdx = floor(idx / 
YMNbgnUYZspjMLjwcIOS); double i_batch = idx - (batchIdx * 
YMNbgnUYZspjMLjwcIOS); double channelIdx = floor(i_batch / 
YNDVziqpDddiXQKYZZhX); outputBuffer[idx] = 
olKGEIcsxmLSoMhRhEtP[static_cast<long int>(channelIdx)] * inputBuffer[idx]; } } 
void __global__ __launch_bounds__(1024) scale_matrix2d_kernel(const float* 
inputBuffer, float* outputBuffer, float* olKGEIcsxmLSoMhRhEtP, double 
YNDVziqpDddiXQKYZZhX, long int YGiQICncmsGZkNUyiQyg) { for (long int 
idx = blockDim.x * blockIdx.x + threadIdx.x; idx < YGiQICncmsGZkNUyiQyg; idx += 
blockDim.x * gridDim.x) { double totalChannelIdx = floor(idx / 
YNDVziqpDddiXQKYZZhX); double i_channel = idx - (totalChannelIdx * 
YNDVziqpDddiXQKYZZhX); outputBuffer[idx] = 
olKGEIcsxmLSoMhRhEtP[static_cast<long int>(i_channel)] * inputBuffer[idx]; } } void 
__global__ __launch_bounds__(1024) scale_tensor3d_kernel(const float* 
inputBuffer, float* outputBuffer, float* olKGEIcsxmLSoMhRhEtP, double 
YMNbgnUYZspjMLjwcIOS, long int YGiQICncmsGZkNUyiQyg) { for (long int 
idx = blockDim.x * blockIdx.x + threadIdx.x; idx < YGiQICncmsGZkNUyiQyg; idx += 
blockDim.x * gridDim.x) { double batchIdx = floor(idx / 
YMNbgnUYZspjMLjwcIOS); double i_batch = idx - (batchIdx * 
YMNbgnUYZspjMLjwcIOS); outputBuffer[idx] = 
olKGEIcsxmLSoMhRhEtP[static_cast<long int>(i_batch)] * inputBuffer[idx]; } } void 
__global__ __launch_bounds__(1024) offset_scalar_kernel(float* inputBuffer, 
float* outputBuffer, float* fYaOQTeunPwVjnhhTECh, long int YGiQICncmsGZkNUyiQyg, 
bool ZDWLzHUkuZuIUZHfbGDY, int bDTIjtxZiSHtjwzgEluE, int 
unSXtdjDjpysqxmbIiPv) { for (long int idx = blockDim.x * blockIdx.x + 
threadIdx.x; idx < YGiQICncmsGZkNUyiQyg; idx += blockDim.x * gridDim.x) { float 
out = inputBuffer[idx] + fYaOQTeunPwVjnhhTECh[0]; if (ZDWLzHUkuZuIUZHfbGDY) { out 
= out > unSXtdjDjpysqxmbIiPv ? unSXtdjDjpysqxmbIiPv : out; out = out < 
bDTIjtxZiSHtjwzgEluE ? bDTIjtxZiSHtjwzgEluE : out; } outputBuffer[idx] = out; 
} } void __global__ __launch_bounds__(1024) offset_vector_kernel(float* 
inputBuffer, float* outputBuffer, float* fYaOQTeunPwVjnhhTECh, double 
YNDVziqpDddiXQKYZZhX, double YMNbgnUYZspjMLjwcIOS, long int 
YGiQICncmsGZkNUyiQyg, bool ZDWLzHUkuZuIUZHfbGDY, int bDTIjtxZiSHtjwzgEluE, int 
unSXtdjDjpysqxmbIiPv) { for (long int idx = blockDim.x * blockIdx.x + 
threadIdx.x; idx < YGiQICncmsGZkNUyiQyg; idx += blockDim.x * gridDim.x) { 
double batchIdx = floor(idx / YMNbgnUYZspjMLjwcIOS); double i_batch = 
idx - (batchIdx * YMNbgnUYZspjMLjwcIOS); double channelIdx = 
floor(i_batch / YNDVziqpDddiXQKYZZhX); float out = inputBuffer[idx] + 
fYaOQTeunPwVjnhhTECh[static_cast<long int>(channelIdx)]; if (ZDWLzHUkuZuIUZHfbGDY) 
{ out = out > unSXtdjDjpysqxmbIiPv ? unSXtdjDjpysqxmbIiPv : out; out = out < 
bDTIjtxZiSHtjwzgEluE ? bDTIjtxZiSHtjwzgEluE : out; } outputBuffer[idx] = out; 
} } void __global__ __launch_bounds__(1024) offset_matrix2d_kernel(float* 
inputBuffer, float* outputBuffer, float* fYaOQTeunPwVjnhhTECh, double 
YNDVziqpDddiXQKYZZhX, long int YGiQICncmsGZkNUyiQyg, bool 
ZDWLzHUkuZuIUZHfbGDY, int bDTIjtxZiSHtjwzgEluE, int unSXtdjDjpysqxmbIiPv) { 
for (long int idx = blockDim.x * blockIdx.x + threadIdx.x; idx < 
YGiQICncmsGZkNUyiQyg; idx += blockDim.x * gridDim.x) { double totalChannelIdx = 
floor(idx / YNDVziqpDddiXQKYZZhX); double i_channel = idx - 
(totalChannelIdx * YNDVziqpDddiXQKYZZhX); float out = 
inputBuffer[idx] + fYaOQTeunPwVjnhhTECh[static_cast<long int>(i_channel)]; if 
(ZDWLzHUkuZuIUZHfbGDY) { out = out > unSXtdjDjpysqxmbIiPv ? 
unSXtdjDjpysqxmbIiPv : out; out = out < bDTIjtxZiSHtjwzgEluE ? 
bDTIjtxZiSHtjwzgEluE : out; } outputBuffer[idx] = out; } } void __global__ 
__launch_bounds__(1024) offset_tensor3d_kernel(float* inputBuffer, float* 
outputBuffer, float* fYaOQTeunPwVjnhhTECh, double YMNbgnUYZspjMLjwcIOS, 
long int YGiQICncmsGZkNUyiQyg, bool ZDWLzHUkuZuIUZHfbGDY, int 
bDTIjtxZiSHtjwzgEluE, int unSXtdjDjpysqxmbIiPv) { for (long int idx = 
blockDim.x * blockIdx.x + threadIdx.x; idx < YGiQICncmsGZkNUyiQyg; idx += 
blockDim.x * gridDim.x) { double batchIdx = floor(idx / 
YMNbgnUYZspjMLjwcIOS); double i_batch = idx - (batchIdx * 
YMNbgnUYZspjMLjwcIOS); float out = inputBuffer[idx] + 
fYaOQTeunPwVjnhhTECh[static_cast<long int>(i_batch)]; if (ZDWLzHUkuZuIUZHfbGDY) { 
out = out > unSXtdjDjpysqxmbIiPv ? unSXtdjDjpysqxmbIiPv : out; out = out < 
bDTIjtxZiSHtjwzgEluE ? bDTIjtxZiSHtjwzgEluE : out; } outputBuffer[idx] = out; 
} }