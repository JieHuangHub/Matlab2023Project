#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWTargetNetworkImplBase.hpp"
#include "layer/MWTargetTypes.hpp"
#else
#include "MWTargetNetworkImplBase.hpp"
#include "MWTargetTypes.hpp"
#endif
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWCudnnCNNLayerImpl.hpp"
#ifdef PRECOMPILE_LAYERFILES
#include "MWCudnnLayerImplFactory_precompile.hpp"
#else
#include "MWCudnnLayerImplFactory.hpp"
#endif
#include <cassert>
#include <cmath>
#include <algorithm>
 namespace MWCudnnTarget { MWTargetNetworkImpl::MWTargetNetworkImpl() : 
MWTargetNetworkImplBase(MWTargetType::CUDNN_TARGET, new 
MWCudnnLayerImplFactory) , xcusoQxPPodcHwVviCWI(0) , 
NXruhrCCiguRjAgSNDuz(NULL) , NbunkIVaMPVYgAQHXXYd(NULL) , 
MW_autoTune(true) , lkGLRakytrdNuJCcpYWt(0) , 
GnxRkpzrPZimKtYYHSuG(0) { } void MWTargetNetworkImpl::allocate(int 
BufSize, int numBufsToAlloc) { numBufs = numBufsToAlloc; 
memBuffer.reserve(numBufs); for (int i = 0; i < numBufs; i++) { float* memPtr = 
NULL; CUDA_CALL(cudaMalloc((void**)&memPtr, sizeof(float) * BufSize)); 
memBuffer.push_back(memPtr); } } void 
MWTargetNetworkImpl::allocatePermuteBuffers(int bufSize, int numBufsToAlloc) { 
for (int i = 0; i < numBufsToAlloc; i++) { float* memPtr = NULL; 
CUDA_CALL(cudaMalloc((void**)&memPtr, sizeof(float) * bufSize)); 
kqftrrQBBOgGsrDSkIUk.push_back(memPtr); } } void 
MWTargetNetworkImpl::preSetup() { NXruhrCCiguRjAgSNDuz = new 
cublasHandle_t(); if (!NXruhrCCiguRjAgSNDuz) { 
MWCNNLayerImpl::throwAllocationError(__LINE__, __FILE__); } 
CUBLAS_CALL(cublasCreate(NXruhrCCiguRjAgSNDuz)); NbunkIVaMPVYgAQHXXYd 
= new cudnnHandle_t(); if (!NbunkIVaMPVYgAQHXXYd) { 
MWCNNLayerImpl::throwAllocationError(__LINE__, __FILE__); } 
CUDNN_CALL(cudnnCreate(NbunkIVaMPVYgAQHXXYd)); } void 
MWTargetNetworkImpl::postSetup(MWCNNLayer* layers[], int numLayers) { if 
(*getProposedWorkSpaceSize() > *getAllocatedWorkSpaceSize()) { if 
(xcusoQxPPodcHwVviCWI) { destroyWorkSpace(xcusoQxPPodcHwVviCWI); } 
createWorkSpace(xcusoQxPPodcHwVviCWI); while ((!xcusoQxPPodcHwVviCWI) && 
(*getProposedWorkSpaceSize() > 0)) { setProposedWorkSpaceSize( 
MWTargetNetworkImpl::getNextProposedWorkSpaceSize(*getProposedWorkSpaceSize())); 
createWorkSpace(xcusoQxPPodcHwVviCWI); } } for (int i = 0; i < numLayers; i++) 
{ layers[i]->postSetup(); } } size_t 
MWTargetNetworkImpl::getNextProposedWorkSpaceSize(size_t failedWorkSpaceSize) { 
assert(failedWorkSpaceSize > 0); return failedWorkSpaceSize / 2; } void 
MWTargetNetworkImpl::createWorkSpace(float*& xkUNToJIgvoLoUQuzKRF) { 
cudaError_t rMMjgjGRAiLVlTlRSByU = cudaMalloc((void**)&xkUNToJIgvoLoUQuzKRF, 
*getProposedWorkSpaceSize()); if (rMMjgjGRAiLVlTlRSByU != cudaSuccess) { 
xkUNToJIgvoLoUQuzKRF = NULL; setAllocatedWorkSpaceSize(0); rMMjgjGRAiLVlTlRSByU 
= cudaGetLastError();  } else { 
setAllocatedWorkSpaceSize(*getProposedWorkSpaceSize()); } } void 
MWTargetNetworkImpl::destroyWorkSpace(float*& xkUNToJIgvoLoUQuzKRF) { 
CUDA_FREE_CALL(xkUNToJIgvoLoUQuzKRF); xkUNToJIgvoLoUQuzKRF = NULL; 
setAllocatedWorkSpaceSize(0); } void 
MWTargetNetworkImpl::setProposedWorkSpaceSize(size_t wss) { 
lkGLRakytrdNuJCcpYWt = wss; } size_t* 
MWTargetNetworkImpl::getProposedWorkSpaceSize() { return 
&lkGLRakytrdNuJCcpYWt; } void 
MWTargetNetworkImpl::setAllocatedWorkSpaceSize(size_t wss) { 
GnxRkpzrPZimKtYYHSuG = wss; } size_t* 
MWTargetNetworkImpl::getAllocatedWorkSpaceSize() { return 
&GnxRkpzrPZimKtYYHSuG; } float* 
MWTargetNetworkImpl::getWorkSpace() { return xcusoQxPPodcHwVviCWI; } float* 
MWTargetNetworkImpl::getPermuteBuffer(int bufIndex) { return 
kqftrrQBBOgGsrDSkIUk[bufIndex]; } cublasHandle_t* 
MWTargetNetworkImpl::getCublasHandle() { return NXruhrCCiguRjAgSNDuz; } 
cudnnHandle_t* MWTargetNetworkImpl::getCudnnHandle() { return 
NbunkIVaMPVYgAQHXXYd; } void MWTargetNetworkImpl::setAutoTune(bool 
autotune) { MW_autoTune = autotune; } bool MWTargetNetworkImpl::getAutoTune() 
const { return MW_autoTune; } void MWTargetNetworkImpl::deallocate() { for (int 
i = 0; i < static_cast<int>(memBuffer.size()); i++) { float* memPtr = 
memBuffer[i]; if (memPtr) { CUDA_FREE_CALL(memPtr); } } memBuffer.clear(); for 
(int i = 0; i < static_cast<int>(kqftrrQBBOgGsrDSkIUk.size()); i++) { 
float* memPtr = kqftrrQBBOgGsrDSkIUk[i]; if (memPtr) { 
CUDA_FREE_CALL(memPtr); } } kqftrrQBBOgGsrDSkIUk.clear(); } void 
MWTargetNetworkImpl::cleanup() { if (xcusoQxPPodcHwVviCWI) { 
destroyWorkSpace(xcusoQxPPodcHwVviCWI); } if (NXruhrCCiguRjAgSNDuz) { if 
(*NXruhrCCiguRjAgSNDuz) { cudaError_t cudaError = cudaPeekAtLastError(); 
if (cudaError != cudaErrorCudartUnloading) { 
CUBLAS_CALL(cublasDestroy(*NXruhrCCiguRjAgSNDuz)); } 
*NXruhrCCiguRjAgSNDuz = NULL; } delete NXruhrCCiguRjAgSNDuz; 
NXruhrCCiguRjAgSNDuz = NULL; } if (NbunkIVaMPVYgAQHXXYd) { if 
(*NbunkIVaMPVYgAQHXXYd) {
#if (CUDNN_MAJOR < 8)
 CUDNN_CALL(cudnnDestroy(*NbunkIVaMPVYgAQHXXYd));
#else
 cudaError_t cudaError = cudaPeekAtLastError(); if (cudaError != 
cudaErrorCudartUnloading) { 
CUDNN_CALL(cudnnDestroy(*NbunkIVaMPVYgAQHXXYd)); }
#endif
 *NbunkIVaMPVYgAQHXXYd = NULL; } delete NbunkIVaMPVYgAQHXXYd; 
NbunkIVaMPVYgAQHXXYd = NULL; } } float* 
MWTargetNetworkImpl::getBufferPtr(int bufferIndex) { 
assert(static_cast<size_t>(bufferIndex) < memBuffer.size()); return 
memBuffer[bufferIndex]; } } 