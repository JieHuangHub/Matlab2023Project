#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnTanhLayerImpl.hpp"
#include <cstdarg>
#include <cassert>
 namespace MWCudnnTarget { MWTanhLayerImpl::MWTanhLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl) : MWCNNLayerImpl(layer, ntwk_impl) { 
CUDNN_CALL(cudnnCreateActivationDescriptor(&rkzbRnJPJHmyWmkoOrFj)); 
createAndAddDescriptor(getLayer()->getOutputTensor(0)->getSourcePortIndex()); 
CUDNN_CALL( cudnnSetActivationDescriptor(rkzbRnJPJHmyWmkoOrFj, 
CUDNN_ACTIVATION_TANH,  CUDNN_NOT_PROPAGATE_NAN, 0)); } 
MWTanhLayerImpl::~MWTanhLayerImpl() { } void MWTanhLayerImpl::propagateSize() { 
MWTensorBase* opTensor = getLayer()->getOutputTensor(0); 
cudnnTensorDescriptor_t* desc = getDescriptor(opTensor->getSourcePortIndex()); 
assert(desc); setDescriptor<float>(*desc, 
static_cast<MWTensor<float>*>(opTensor)); } void MWTanhLayerImpl::predict() { 
MWCNNLayer* TanhLayer = getLayer(); MWTensorBase* ipTensorBase = 
TanhLayer->getInputTensor(0); MWTensorBase* opTensorBase = 
TanhLayer->getOutputTensor(0); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
cudnnTensorDescriptor_t ipDesc = 
MWCNNLayerImpl::getCuDNNDescriptor(ipTensorBase); 
CUDNN_CALL(cudnnActivationForward(*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), 
rkzbRnJPJHmyWmkoOrFj, getOnePtr(), ipDesc, ipTensor->getData(), getZeroPtr(), 
*desc, opTensor->getData())); } void MWTanhLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyActivationDescriptor(rkzbRnJPJHmyWmkoOrFj)); } } 