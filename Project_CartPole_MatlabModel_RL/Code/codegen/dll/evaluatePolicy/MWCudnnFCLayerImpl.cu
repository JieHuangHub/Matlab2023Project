#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnFCLayerImpl.hpp"
#include <vector>
 namespace MWCudnnTarget { MWFCLayerImpl::MWFCLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int XLJXOFXdnZOyJvtltbyr, int 
kMyEnepVyoNObTPqIpWo, const char* xHViLEwTujGGrPZZgmbF, const char* 
JwxFdqOKggeawILBfGgg) : MWCNNLayerImpl(layer, ntwk_impl) , 
BkwhtPQUCQKchmmimoXs(XLJXOFXdnZOyJvtltbyr) , 
BlRIQPyqJZORKENzSdYf(kMyEnepVyoNObTPqIpWo) , vIWQzNvYZSuxmOTVDFhU(NULL) , 
vpXxoeEhdEosLSsYXkNG(NULL) , IpFhwalnAlrMvcuyQpQD(NULL) , 
xHiBGayUfxIpXKkCTDNU(false) { 
CUDNN_CALL(cudnnCreateTensorDescriptor(&JgLfgHrHMEMmMYTettJF)); 
createAndAddDescriptor(getLayer()->getOutputTensor(0)->getSourcePortIndex()); 
CUDA_CALL(cudaMalloc((void**)&vIWQzNvYZSuxmOTVDFhU, sizeof(float) * 
BkwhtPQUCQKchmmimoXs * BlRIQPyqJZORKENzSdYf)); 
CUDA_CALL(cudaMalloc((void**)&IpFhwalnAlrMvcuyQpQD, sizeof(float) * 
BlRIQPyqJZORKENzSdYf)); vpXxoeEhdEosLSsYXkNG = 
MALLOC_CALL(sizeof(float) * BkwhtPQUCQKchmmimoXs * 
BlRIQPyqJZORKENzSdYf); loadWeights(xHViLEwTujGGrPZZgmbF); 
loadBias(JwxFdqOKggeawILBfGgg); } MWFCLayerImpl::~MWFCLayerImpl() { } void 
MWFCLayerImpl::propagateSize() { MWCNNLayer* fcLayer = getLayer(); 
MWTensorBase* opTensor = fcLayer->getOutputTensor(0); cudnnTensorDescriptor_t* 
desc = getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
setDescriptor<float>(*desc, static_cast<MWTensor<float>*>(opTensor)); if 
(opTensor->getSequenceLength() == 1) { 
CUDNN_CALL(cudnnSetTensor4dDescriptor(JgLfgHrHMEMmMYTettJF, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, 1, BlRIQPyqJZORKENzSdYf, 1, 1)); } else { int dims[5] 
= {1, 1, BlRIQPyqJZORKENzSdYf, 1, 1}; int strides[5]; 
MWTensorBase::getStrides(dims, 5, strides); CUDNN_CALL( 
cudnnSetTensorNdDescriptor(JgLfgHrHMEMmMYTettJF, CUDNN_DATA_FLOAT, 5, dims, 
strides)); } } void MWFCLayerImpl::loadWeights(const char* PmFfARVzoHVAYkfpuvqK) 
{ FILE* QMgBqCuvjnbWHWiVPEwn = MWCNNLayer::openBinaryFile(PmFfARVzoHVAYkfpuvqK); 
assert(QMgBqCuvjnbWHWiVPEwn); int cRtIUoZRPICuQEOZOSzT = BkwhtPQUCQKchmmimoXs * 
BlRIQPyqJZORKENzSdYf;  MWCNNLayer::call_fread(vpXxoeEhdEosLSsYXkNG, 
sizeof(float), cRtIUoZRPICuQEOZOSzT, QMgBqCuvjnbWHWiVPEwn, PmFfARVzoHVAYkfpuvqK); 
fclose(QMgBqCuvjnbWHWiVPEwn); } void MWFCLayerImpl::prepareWeights(float* 
wqggPBXZvtlxnxwngvAq) { int cRtIUoZRPICuQEOZOSzT = BkwhtPQUCQKchmmimoXs * 
BlRIQPyqJZORKENzSdYf; MWCNNLayer* fcLayer = getLayer(); MWTensorBase* 
ipTensor = fcLayer->getInputTensor(0); if (ipTensor->getHeight() != 1 && 
ipTensor->getWidth() != 1) { float* KHjdvykTFbUxdfZTFbqy = 
MALLOC_CALL(sizeof(float) * ipTensor->getHeight() * ipTensor->getWidth()); for 
(int k = 0; k < cRtIUoZRPICuQEOZOSzT / ipTensor->getHeight() / ipTensor->getWidth(); 
k++) { for (int i = 0; i < ipTensor->getHeight() * ipTensor->getWidth(); i++) 
KHjdvykTFbUxdfZTFbqy[i] = wqggPBXZvtlxnxwngvAq[k * ipTensor->getHeight() * 
ipTensor->getWidth() + i]; for (int j = 0; j < ipTensor->getHeight(); j++) for 
(int i = 0; i < ipTensor->getWidth(); i++) wqggPBXZvtlxnxwngvAq[k * 
ipTensor->getHeight() * ipTensor->getWidth() + j * ipTensor->getWidth() + i] = 
KHjdvykTFbUxdfZTFbqy[j + i * ipTensor->getHeight()]; } free(KHjdvykTFbUxdfZTFbqy); } 
CUDA_CALL(cudaMemcpy(vIWQzNvYZSuxmOTVDFhU, wqggPBXZvtlxnxwngvAq, sizeof(float) * 
cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); } void MWFCLayerImpl::loadBias(const 
char* PmFfARVzoHVAYkfpuvqK) { MWCNNLayer* fcLayer = getLayer(); MWTensorBase* 
opTensor = fcLayer->getOutputTensor(0); FILE* QMgBqCuvjnbWHWiVPEwn = 
MWCNNLayer::openBinaryFile(PmFfARVzoHVAYkfpuvqK); assert(QMgBqCuvjnbWHWiVPEwn); int 
cRtIUoZRPICuQEOZOSzT = BlRIQPyqJZORKENzSdYf;  float* KHjdvykTFbUxdfZTFbqy = 
MALLOC_CALL(sizeof(float) * cRtIUoZRPICuQEOZOSzT); 
MWCNNLayer::call_fread(KHjdvykTFbUxdfZTFbqy, sizeof(float), cRtIUoZRPICuQEOZOSzT, 
QMgBqCuvjnbWHWiVPEwn, PmFfARVzoHVAYkfpuvqK); CUDA_CALL(cudaMemcpy(IpFhwalnAlrMvcuyQpQD, 
KHjdvykTFbUxdfZTFbqy, sizeof(float) * cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); 
free(KHjdvykTFbUxdfZTFbqy); fclose(QMgBqCuvjnbWHWiVPEwn); } void 
MWFCLayerImpl::setLearnables(std::vector<float*> learnables) { 
assert(learnables.size() == 2); float* wqggPBXZvtlxnxwngvAq = learnables[0]; 
prepareWeights(wqggPBXZvtlxnxwngvAq); float* JLxVZWxVuFDRoIFIqrjf = learnables[1]; 
CUDA_CALL(cudaMemcpy(IpFhwalnAlrMvcuyQpQD, JLxVZWxVuFDRoIFIqrjf, sizeof(float) * 
BlRIQPyqJZORKENzSdYf, cudaMemcpyHostToDevice)); } void 
MWFCLayerImpl::postSetup() { if (!xHiBGayUfxIpXKkCTDNU) { 
prepareWeights(vpXxoeEhdEosLSsYXkNG); free(vpXxoeEhdEosLSsYXkNG); 
vpXxoeEhdEosLSsYXkNG = NULL; xHiBGayUfxIpXKkCTDNU = true; } } void 
MWFCLayerImpl::predict() { MWCNNLayer* fcLayer = getLayer(); MWTensorBase* 
ipTensorBase = fcLayer->getInputTensor(0); MWTensorBase* opTensorBase = 
fcLayer->getOutputTensor(0); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); int numOutputRows = 
opTensor->getChannels(); int numOutputCols = ipTensor->getBatchSize() * 
ipTensor->getSequenceLength(); int innerDimension = ipTensor->getHeight() * 
ipTensor->getWidth() * ipTensor->getChannels(); int TxNFOfYScyqGlEFFxbAv = 1; int 
UEESbUvbMihFnquvuFij = 1; if (opTensor->getBatchSize() == 1 && 
opTensor->getSequenceLength() == 1) { CUDA_CALL(cudaMemcpy(opTensor->getData(), 
IpFhwalnAlrMvcuyQpQD, sizeof(float) * numOutputRows, cudaMemcpyDeviceToDevice)); 
CUBLAS_CALL(cublasSgemv(*cQBKlCKXxecGPJrXBXdk->getCublasHandle(), CUBLAS_OP_T, 
innerDimension, numOutputRows, getOnePtr(), vIWQzNvYZSuxmOTVDFhU, innerDimension, 
ipTensor->getData(), TxNFOfYScyqGlEFFxbAv, getOnePtr(), opTensor->getData(), 
UEESbUvbMihFnquvuFij)); } else { 
CUBLAS_CALL(cublasSgemm(*cQBKlCKXxecGPJrXBXdk->getCublasHandle(), CUBLAS_OP_T, 
CUBLAS_OP_N, numOutputRows, numOutputCols, innerDimension, getOnePtr(), 
vIWQzNvYZSuxmOTVDFhU, innerDimension, ipTensor->getData(), innerDimension, 
getZeroPtr(), opTensor->getData(), numOutputRows)); cudnnTensorDescriptor_t* 
desc = getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
CUDNN_CALL(cudnnAddTensor(*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), getOnePtr(), 
JgLfgHrHMEMmMYTettJF, IpFhwalnAlrMvcuyQpQD, getOnePtr(), *desc, opTensor->getData())); } 
return; } void MWFCLayerImpl::cleanup() { if (vIWQzNvYZSuxmOTVDFhU) { 
CUDA_FREE_CALL(vIWQzNvYZSuxmOTVDFhU); vIWQzNvYZSuxmOTVDFhU = NULL; } 
CUDNN_CALL(cudnnDestroyTensorDescriptor(JgLfgHrHMEMmMYTettJF)); if 
(IpFhwalnAlrMvcuyQpQD) { CUDA_FREE_CALL(IpFhwalnAlrMvcuyQpQD); IpFhwalnAlrMvcuyQpQD = NULL; } } } 