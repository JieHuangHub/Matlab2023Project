#include "MWCudnnCommonHeaders.hpp"
#include <cstdlib>
#include <cassert>
#include <cstdio>
#include <stdexcept>
#include <sstream>
 namespace MWCudnnTarget { float* malloc_call_line_file(size_t msize, const int 
ZqQxEyCjEixByRZYMkbj, const char* PfisSEEWDaQFynnzlcin) { float* mem = 
(float*)malloc(msize); if (!mem) { 
MWCNNLayerImpl::throwAllocationError(ZqQxEyCjEixByRZYMkbj, PfisSEEWDaQFynnzlcin); } 
return mem; } void cuda_call_line_file(cudaError_t rMMjgjGRAiLVlTlRSByU, const int 
ZqQxEyCjEixByRZYMkbj, const char* PfisSEEWDaQFynnzlcin) { if (rMMjgjGRAiLVlTlRSByU != 
cudaSuccess) { throw_cuda_error(rMMjgjGRAiLVlTlRSByU, ZqQxEyCjEixByRZYMkbj, 
PfisSEEWDaQFynnzlcin); } } void throw_cuda_error(cudaError_t rMMjgjGRAiLVlTlRSByU, 
const int ZqQxEyCjEixByRZYMkbj, const char* PfisSEEWDaQFynnzlcin) { std::stringstream ss; 
ss << "CUDA Error " << rMMjgjGRAiLVlTlRSByU << "(" << 
cudaGetErrorString(rMMjgjGRAiLVlTlRSByU) << ") at line " << ZqQxEyCjEixByRZYMkbj << 
", file: " << PfisSEEWDaQFynnzlcin << "\n"; rMMjgjGRAiLVlTlRSByU = cudaGetLastError();  
throw std::runtime_error(ss.str()); } void cudnn_call_line_file(cudnnStatus_t 
rMMjgjGRAiLVlTlRSByU, const int ZqQxEyCjEixByRZYMkbj, const char* PfisSEEWDaQFynnzlcin) { if 
(rMMjgjGRAiLVlTlRSByU != CUDNN_STATUS_SUCCESS) { std::stringstream ss; ss << 
"CuDNN Error " << rMMjgjGRAiLVlTlRSByU << "(" << 
cudnnGetErrorString(rMMjgjGRAiLVlTlRSByU) << ") at line " << ZqQxEyCjEixByRZYMkbj << 
", file: " << PfisSEEWDaQFynnzlcin << "\n"; throw std::runtime_error(ss.str()); } } 
const char* cublasGetErrorString(cublasStatus_t rMMjgjGRAiLVlTlRSByU) { switch 
(rMMjgjGRAiLVlTlRSByU) { case CUBLAS_STATUS_SUCCESS: return 
"CUBLAS_STATUS_SUCCESS"; case CUBLAS_STATUS_NOT_INITIALIZED: return 
"CUBLAS_STATUS_NOT_INITIALIZED"; case CUBLAS_STATUS_ALLOC_FAILED: return 
"CUBLAS_STATUS_ALLOC_FAILED"; case CUBLAS_STATUS_INVALID_VALUE: return 
"CUBLAS_STATUS_INVALID_VALUE"; case CUBLAS_STATUS_ARCH_MISMATCH: return 
"CUBLAS_STATUS_ARCH_MISMATCH"; case CUBLAS_STATUS_MAPPING_ERROR: return 
"CUBLAS_STATUS_MAPPING_ERROR"; case CUBLAS_STATUS_EXECUTION_FAILED: return 
"CUBLAS_STATUS_EXECUTION_FAILED"; case CUBLAS_STATUS_INTERNAL_ERROR: return 
"CUBLAS_STATUS_INTERNAL_ERROR"; case CUBLAS_STATUS_NOT_SUPPORTED: return 
"CUBLAS_STATUS_NOT_SUPPORTED"; case CUBLAS_STATUS_LICENSE_ERROR: return 
"CUBLAS_STATUS_LICENSE_ERROR"; } return "unknown error"; } void 
cublas_call_line_file(cublasStatus_t rMMjgjGRAiLVlTlRSByU, const int 
ZqQxEyCjEixByRZYMkbj, const char* PfisSEEWDaQFynnzlcin) { if (rMMjgjGRAiLVlTlRSByU != 
CUBLAS_STATUS_SUCCESS) { std::stringstream ss; ss << "CuBLAS Error " << 
rMMjgjGRAiLVlTlRSByU << "(" << cublasGetErrorString(rMMjgjGRAiLVlTlRSByU) << 
") at line " << ZqQxEyCjEixByRZYMkbj << ", file: " << PfisSEEWDaQFynnzlcin << "\n"; throw 
std::runtime_error(ss.str()); } } MWCNNLayerImpl::MWCNNLayerImpl(MWCNNLayer* 
layer, MWTargetNetworkImpl* ntwk_impl) : MWCNNLayerImplBase(layer) , 
OwscQfaoXJuSJFwXQahz(0.0) , OumvfgWXDdmsQaciHMHx(1.0) , OVOphSOolqRQDDoKPwxy(-1.0) , 
cQBKlCKXxecGPJrXBXdk(ntwk_impl) { } MWCNNLayerImpl::~MWCNNLayerImpl() { for 
(std::map<int, cudnnTensorDescriptor_t*>::iterator it = 
jhFUWlztBndwjbXwYNaJ.begin(); it != jhFUWlztBndwjbXwYNaJ.end(); ++it) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*it->second)); delete it->second; 
it->second = 0; } } void MWCNNLayerImpl::allocateOutput(int outIdx) { if 
(getLayer()->getOutputTensor(outIdx)->isFloat()) { 
this->allocateOutputImpl<float>(outIdx); } else { 
assert(getLayer()->getOutputTensor(outIdx)->isInt8()); 
this->allocateOutputImpl<signed char>(outIdx); } } template <class T> void 
MWCNNLayerImpl::allocateOutputImpl(int outIdx) { MWTensorBase* opTensorBase = 
getLayer()->getOutputTensor(outIdx); bool bufferReuse = 
opTensorBase->getopBufIndex() >= 0; if (bufferReuse) { 
assert(opTensorBase->isFloat()); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); float* buffer = 
cQBKlCKXxecGPJrXBXdk->getBufferPtr(opTensor->getopBufIndex()); int inIdx = 
getLayer()->getInPlaceIndex(outIdx); if (inIdx != -1) { MWTensor<float>* 
ipTensor = static_cast<MWTensor<float>*>(getLayer()->getInputTensor(inIdx)); 
buffer = ipTensor->getData(); assert(buffer); } float* opPointer = 
offsetOutputPointer(buffer, outIdx); assert(opPointer); 
opTensor->setData(opPointer); } else { int inIdx = 
getLayer()->getInPlaceIndex(outIdx); if (inIdx != -1) { MWTensor<T>* ipTensor = 
static_cast<MWTensor<T>*>(getLayer()->getInputTensor(inIdx)); MWTensor<T>* 
opTensor = static_cast<MWTensor<T>*>(opTensorBase); T* ipData = 
ipTensor->getData(); assert(ipData); T* opPointer = offsetOutputPointer(ipData, 
outIdx); assert(opPointer); opTensor->setData(opPointer); } else { MWTensor<T>* 
opTensor = static_cast<MWTensor<T>*>(opTensorBase); T* NzudlCvUcxBgCSkidIap; 
CUDA_CALL(cudaMalloc((void**)&NzudlCvUcxBgCSkidIap, sizeof(T) * 
opTensor->getNumElements())); opTensor->setData(NzudlCvUcxBgCSkidIap); } } } 
template void MWCNNLayerImpl::allocateOutputImpl<float>(int); template void 
MWCNNLayerImpl::allocateOutputImpl<signed char>(int); void 
MWCNNLayerImpl::deallocateOutput(int outIdx) { if 
(getLayer()->getOutputTensor(outIdx)->isFloat()) { 
this->deallocateOutputImpl<float>(outIdx); } else { 
assert(getLayer()->getOutputTensor(outIdx)->isInt8()); 
this->deallocateOutputImpl<signed char>(outIdx); } } template <class T> void 
MWCNNLayerImpl::deallocateOutputImpl(int outIdx) { if 
(getLayer()->getInPlaceIndex(outIdx) == -1) { MWTensor<T>* opTensor = 
static_cast<MWTensor<T>*>(getLayer()->getOutputTensor(outIdx)); T* data = 
opTensor->getData(); CUDA_FREE_CALL(data); } } template void 
MWCNNLayerImpl::deallocateOutputImpl<float>(int); template void 
MWCNNLayerImpl::deallocateOutputImpl<signed char>(int); float* 
MWCNNLayerImpl::getZeroPtr() { return &OwscQfaoXJuSJFwXQahz; } float* 
MWCNNLayerImpl::getOnePtr() { return &OumvfgWXDdmsQaciHMHx; } float* 
MWCNNLayerImpl::getNegOnePtr() { return &OVOphSOolqRQDDoKPwxy; } 
cudnnTensorDescriptor_t* MWCNNLayerImpl::createAndAddDescriptor(int index) { 
std::map<int, cudnnTensorDescriptor_t*>::iterator it = 
jhFUWlztBndwjbXwYNaJ.find(index); assert(it == jhFUWlztBndwjbXwYNaJ.end()); 
cudnnTensorDescriptor_t* newDescriptor = new cudnnTensorDescriptor_t; if 
(!newDescriptor) { MWCNNLayerImpl::throwAllocationError(__LINE__, __FILE__); } 
jhFUWlztBndwjbXwYNaJ[index] = newDescriptor; 
CUDNN_CALL(cudnnCreateTensorDescriptor(newDescriptor)); return newDescriptor; } 
cudnnTensorDescriptor_t* MWCNNLayerImpl::getDescriptor(int index) { 
std::map<int, cudnnTensorDescriptor_t*>::iterator it = 
jhFUWlztBndwjbXwYNaJ.find(index); if (it != jhFUWlztBndwjbXwYNaJ.end()) { 
return it->second; } else { return NULL; } } template <class T> void 
MWCNNLayerImpl::setDescriptor(cudnnTensorDescriptor_t& desc, MWTensor<T>* 
tensor) { if (tensor->getSequenceLength() == 1) { 
CUDNN_CALL(cudnnSetTensor4dDescriptor(desc, CUDNN_TENSOR_NCHW, 
MWCNNLayerImpl::getCuDNNDataType<T>(), tensor->getBatchSize(),  
tensor->getChannels(),  tensor->getHeight(),  tensor->getWidth()));  } else { 
int dims[5] = {tensor->getSequenceLength(), tensor->getBatchSize(), 
tensor->getChannels(), tensor->getHeight(), tensor->getWidth()}; int 
strides[5]; MWTensorBase::getStrides(dims, 5, strides); 
CUDNN_CALL(cudnnSetTensorNdDescriptor(desc, 
MWCNNLayerImpl::getCuDNNDataType<T>(), 5, dims, strides)); } } template void 
MWCNNLayerImpl::setDescriptor<float>(cudnnTensorDescriptor_t&, 
MWTensor<float>*); template void MWCNNLayerImpl::setDescriptor<signed 
char>(cudnnTensorDescriptor_t&, MWTensor<signed char>*); template <> 
cudnnDataType_t MWCNNLayerImpl::getCuDNNDataType<float>() { return 
CUDNN_DATA_FLOAT; } template <> cudnnDataType_t 
MWCNNLayerImpl::getCuDNNDataType<signed char>() { return CUDNN_DATA_INT8; } 
cudnnTensorDescriptor_t MWCNNLayerImpl::getCuDNNDescriptor(MWTensorBase* 
tensor) { MWCNNLayer* layer = tensor->getOwner(); MWCNNLayerImpl* impl = 
static_cast<MWCNNLayerImpl*>(layer->getImpl()); if (impl) { 
cudnnTensorDescriptor_t* desc = 
impl->getDescriptor(tensor->getSourcePortIndex()); if (desc == NULL) { 
impl->createAndAddDescriptor(tensor->getSourcePortIndex()); desc = 
impl->getDescriptor(tensor->getSourcePortIndex()); assert(desc); } if 
(tensor->isFloat()) { MWCNNLayerImpl::setDescriptor<float>(*desc, 
static_cast<MWTensor<float>*>(tensor)); } else { assert(tensor->isInt8()); 
MWCNNLayerImpl::setDescriptor<signed char>(*desc, static_cast<MWTensor<signed 
char>*>(tensor)); } return *desc; } else { cudnnTensorDescriptor_t 
tmpDescriptor; CUDNN_CALL(cudnnCreateTensorDescriptor(&tmpDescriptor)); if 
(tensor->isFloat()) { MWCNNLayerImpl::setDescriptor<float>(tmpDescriptor, 
static_cast<MWTensor<float>*>(tensor)); } else { assert(tensor->isInt8()); 
MWCNNLayerImpl::setDescriptor<signed char>(tmpDescriptor, 
static_cast<MWTensor<signed char>*>(tensor)); } return tmpDescriptor; } } void 
__global__ __launch_bounds__(1024) padInputImpl(float* in, int inputH, int 
inputW, int inputCh, int outputH, int outputW, int offsetH, int offsetW, float* 
out, int inputElems) { for (int i = blockDim.x * blockIdx.x + threadIdx.x; i < 
inputElems; i += blockDim.x * gridDim.x) { int idxB = i / (inputH * inputW * 
inputCh); int rem = (i - idxB * (inputH * inputW * inputCh)); int idxCh = rem / 
(inputH * inputW); int rem1 = rem - idxCh * (inputH * inputW); int idxH = rem1 
/ inputW; int idxCol = rem1 - idxH * inputW; if ((idxH < inputH) && (idxCol < 
inputW)) { int outputR = idxH + offsetH; int outputCol = idxCol + offsetW; int 
outputCh = inputCh; out[idxB * (outputH * outputW * outputCh) + idxCh * 
(outputH * outputW) + outputR * (outputW) + outputCol] = in[i]; } } } void 
MWCNNLayerImpl::padInput(float* SugesRlPIbOVzRgNWRnl, int UzaGmBLFEwmwaFXebUma, int 
VFKMunbyHoAmpHUSkuUn, int UzOdnHgHuNHtprVxxxXl, int jmcFOAbZArjGDNhshSro, int 
kFQQPKSOkZeHlmrkAXuE, int fjfzkUfcCOqjrkAVGfuc, int gGtqPpFypRDdniDkzLXN, float* 
iwclITrbVyVrJaArrXNr, int dkLDkRwCBjeybwDHbKiE) { int shEncNmxJsMuJKwbrwok = 
(dkLDkRwCBjeybwDHbKiE + 31) / 32 * 32; shEncNmxJsMuJKwbrwok = 
(shEncNmxJsMuJKwbrwok < 1024) ? shEncNmxJsMuJKwbrwok : 1024; int 
KCudOrFMfgCzUPMcdePX = (dkLDkRwCBjeybwDHbKiE + shEncNmxJsMuJKwbrwok - 
1) / shEncNmxJsMuJKwbrwok; padInputImpl<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( SugesRlPIbOVzRgNWRnl, UzaGmBLFEwmwaFXebUma, 
VFKMunbyHoAmpHUSkuUn, UzOdnHgHuNHtprVxxxXl, jmcFOAbZArjGDNhshSro, kFQQPKSOkZeHlmrkAXuE, 
fjfzkUfcCOqjrkAVGfuc, gGtqPpFypRDdniDkzLXN, iwclITrbVyVrJaArrXNr, dkLDkRwCBjeybwDHbKiE); } 
void __global__ __launch_bounds__(1024) fillOutputBufferImpl(signed char* in, 
int inputH, int inputW, int inputCh, int outputH, int outputW, int offsetH, int 
offsetW, signed char* out, int inputElems, int outputCh) { for (int i = 
blockDim.x * blockIdx.x + threadIdx.x; i < inputElems; i += blockDim.x * 
gridDim.x) { int idxB = i / (inputH * inputW * inputCh); int rem = (i - idxB * 
(inputH * inputW * inputCh)); int idxCh = rem / (inputH * inputW); int rem1 = 
rem - idxCh * (inputH * inputW); int idxH = rem1 / inputW; int idxCol = rem1 - 
idxH * inputW; if ((idxH < inputH) && (idxCol < inputW)) { int outputR = idxH + 
offsetH; int outputCol = idxCol + offsetW; *(out + idxB * (outputH * outputW * 
outputCh) + idxCh * (outputH * outputW) + outputR * (outputW) + outputCol) = 
*(in + i); } } } void MWCNNLayerImpl::fillOutputBuffer(signed char* 
SugesRlPIbOVzRgNWRnl, int UzaGmBLFEwmwaFXebUma, int VFKMunbyHoAmpHUSkuUn, int 
UzOdnHgHuNHtprVxxxXl, int jmcFOAbZArjGDNhshSro, int kFQQPKSOkZeHlmrkAXuE, int 
fjfzkUfcCOqjrkAVGfuc, int gGtqPpFypRDdniDkzLXN, signed char* iwclITrbVyVrJaArrXNr, int 
dkLDkRwCBjeybwDHbKiE, int jfkhqXBmwICFStMidrQt) { int shEncNmxJsMuJKwbrwok 
= (dkLDkRwCBjeybwDHbKiE < 1024) ? dkLDkRwCBjeybwDHbKiE : 1024; int 
KCudOrFMfgCzUPMcdePX = (dkLDkRwCBjeybwDHbKiE + shEncNmxJsMuJKwbrwok - 
1) / shEncNmxJsMuJKwbrwok; 
fillOutputBufferImpl<<<KCudOrFMfgCzUPMcdePX, shEncNmxJsMuJKwbrwok>>>( 
SugesRlPIbOVzRgNWRnl, UzaGmBLFEwmwaFXebUma, VFKMunbyHoAmpHUSkuUn, UzOdnHgHuNHtprVxxxXl, 
jmcFOAbZArjGDNhshSro, kFQQPKSOkZeHlmrkAXuE, fjfzkUfcCOqjrkAVGfuc, gGtqPpFypRDdniDkzLXN, 
iwclITrbVyVrJaArrXNr, dkLDkRwCBjeybwDHbKiE, jfkhqXBmwICFStMidrQt); } void 
MWCNNLayerImpl::throwAllocationError(const int line, const char* file) { 
std::stringstream ss; ss << "Failed to allocate memory at line : " << line << 
", file : " << file << "\n"; throw std::runtime_error(ss.str()); } void 
MWCNNLayerImpl::setDescriptorForINT8(cudnnTensorDescriptor_t& desc, 
MWTensor<signed char>* tensor, cudnnDataType_t dataType, cudnnTensorFormat_t 
dataFormat) { CUDNN_CALL(cudnnSetTensor4dDescriptor(desc, dataFormat, dataType, 
tensor->getBatchSize(),  tensor->getChannels(),  tensor->getHeight(),  
tensor->getWidth()));  } } 