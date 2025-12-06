#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnCustomLayerBase.hpp"
#include <map>
 MWCudnnCustomLayerBase::MWCudnnCustomLayerBase() : m_ntwkImpl(NULL) { 
m_isCustomLayer = true; } void 
MWCudnnCustomLayerBase::setupLayer(MWCudnnTarget::MWTargetNetworkImpl* 
targetImpl) { m_ntwkImpl = targetImpl; } void 
MWCudnnCustomLayerBase::createInOutDescriptors(MWTensorBase* aTensor) { 
std::map<MWTensorBase*, cudnnTensorDescriptor_t*>::iterator it = 
m_inOutDescriptor.find(aTensor); if (it == m_inOutDescriptor.end()) { 
m_inOutDescriptor[aTensor] = new cudnnTensorDescriptor_t; 
CUDNN_CALL(cudnnCreateTensorDescriptor(m_inOutDescriptor[aTensor])); } } void 
MWCudnnCustomLayerBase::createInOutTransformDescriptors(MWTensorBase* aTensor) 
{ std::map<MWTensorBase*, cudnnTensorDescriptor_t*>::iterator it = 
m_inOutTransformDescriptor.find(aTensor); if (it == 
m_inOutTransformDescriptor.end()) { m_inOutTransformDescriptor[aTensor] = new 
cudnnTensorDescriptor_t; 
CUDNN_CALL(cudnnCreateTensorDescriptor(m_inOutTransformDescriptor[aTensor])); } 
} void MWCudnnCustomLayerBase::setupInputDescriptors(MWTensorBase* aTensor, 
MWTensorBase::DIMSLABEL srcLayout[], MWTensorBase::DIMSLABEL 
customImplLayout[]) { createInOutDescriptors(aTensor); const int size = 5; int 
inDims[size]; aTensor->getDimsByLayout(srcLayout, size, inDims); int 
strides[size]; MWTensorBase::getStrides(inDims, size, strides); 
CUDNN_CALL(cudnnSetTensorNdDescriptor(*m_inOutDescriptor[aTensor], 
CUDNN_DATA_FLOAT, size, inDims, strides)); 
createInOutTransformDescriptors(aTensor); int outDims[size]; 
aTensor->getDimsByLayout(customImplLayout, size, outDims); 
MWTensorBase::getTransformStrides( srcLayout, customImplLayout, outDims, size, 
strides);  
CUDNN_CALL(cudnnSetTensorNdDescriptor(*m_inOutTransformDescriptor[aTensor], 
CUDNN_DATA_FLOAT, size, inDims, strides));  } void 
MWCudnnCustomLayerBase::setupOutputDescriptors(MWTensorBase* aTensor, 
MWTensorBase::DIMSLABEL customImplLayout[], MWTensorBase::DIMSLABEL 
destLayout[]) { createInOutDescriptors(aTensor); const int size = 5; int 
inDims[size]; aTensor->getDimsByLayout(customImplLayout, size, inDims); int 
strides[size]; MWTensorBase::getStrides(inDims, size, strides); 
CUDNN_CALL(cudnnSetTensorNdDescriptor(*m_inOutDescriptor[aTensor], 
CUDNN_DATA_FLOAT, size, inDims, strides)); 
createInOutTransformDescriptors(aTensor); int outDims[size]; 
aTensor->getDimsByLayout(destLayout, size, outDims); 
MWTensorBase::getTransformStrides(customImplLayout, destLayout, outDims, size, 
strides);  
CUDNN_CALL(cudnnSetTensorNdDescriptor(*m_inOutTransformDescriptor[aTensor], 
CUDNN_DATA_FLOAT, size, inDims, strides)); } void 
MWCudnnCustomLayerBase::reorderInputData(MWTensorBase* aTensor, int bufIndex) { 
float oneV = 1.0; float zeroV = 0.0; CUDNN_CALL(cudnnTransformTensor( 
*m_ntwkImpl->getCudnnHandle(), &oneV, *m_inOutDescriptor[aTensor], 
static_cast<MWTensor<float>*>(aTensor)->getData(), &zeroV, 
*m_inOutTransformDescriptor[aTensor], m_ntwkImpl->getPermuteBuffer(bufIndex))); 
} void MWCudnnCustomLayerBase::reorderOutputData(MWTensorBase* aTensor, int 
bufIndex) { float oneV = 1.0; float zeroV = 0.0; 
CUDNN_CALL(cudnnTransformTensor( *m_ntwkImpl->getCudnnHandle(), &oneV, 
*m_inOutDescriptor[aTensor], m_ntwkImpl->getPermuteBuffer(bufIndex), &zeroV, 
*m_inOutTransformDescriptor[aTensor], 
static_cast<MWTensor<float>*>(aTensor)->getData())); } void 
MWCudnnCustomLayerBase::allocate() { for (size_t iOut = 0; iOut < 
getNumOutputs(); iOut++) { MWTensorBase* opTensorBase = getOutputTensor(iOut); 
MWTensor<float>* opTensor = static_cast<MWTensor<float>*>(opTensorBase); 
opTensor->setData(m_ntwkImpl->getBufferPtr(opTensor->getopBufIndex())); } } 
void MWCudnnCustomLayerBase::deallocate() { for (size_t iOut = 0; iOut < 
getNumOutputs(); iOut++) { 
static_cast<MWTensor<float>*>(getOutputTensor(iOut))->setData((float*)NULL); } 
} void MWCudnnCustomLayerBase::cleanup() { for (std::map<MWTensorBase*, 
cudnnTensorDescriptor_t*>::iterator it = m_inOutDescriptor.begin(); it != 
m_inOutDescriptor.end(); ++it) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*it->second)); delete it->second; 
it->second = 0; } for (std::map<MWTensorBase*, 
cudnnTensorDescriptor_t*>::iterator it = m_inOutTransformDescriptor.begin(); it 
!= m_inOutTransformDescriptor.end(); ++it) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*it->second)); delete it->second; 
it->second = 0; } this->cleanupLayer(); this->MWCNNLayer::cleanup(); } 
MWCudnnCustomLayerBase::~MWCudnnCustomLayerBase() { }