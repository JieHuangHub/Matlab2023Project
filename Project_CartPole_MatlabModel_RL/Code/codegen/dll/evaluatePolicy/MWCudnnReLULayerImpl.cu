#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnReLULayerImpl.hpp"
 namespace MWCudnnTarget { MWReLULayerImpl::MWReLULayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl) : MWCNNLayerImpl(layer, ntwk_impl) { 
CUDNN_CALL(cudnnCreateActivationDescriptor(&muwRQxtWMMXAPxSuMYBw)); 
createAndAddDescriptor(getLayer()->getOutputTensor(0)->getSourcePortIndex()); } 
MWReLULayerImpl::~MWReLULayerImpl() { } void MWReLULayerImpl::propagateSize() { 
MWTensorBase* opTensor = getLayer()->getOutputTensor(0); 
cudnnTensorDescriptor_t* desc = getDescriptor(opTensor->getSourcePortIndex()); 
assert(desc); setDescriptor<float>(*desc, 
static_cast<MWTensor<float>*>(opTensor)); 
CUDNN_CALL(cudnnSetActivationDescriptor(muwRQxtWMMXAPxSuMYBw, 
CUDNN_ACTIVATION_RELU, CUDNN_NOT_PROPAGATE_NAN, 0)); } void 
MWReLULayerImpl::predict() { MWTensorBase* ipTensorBase = 
getLayer()->getInputTensor(0); MWTensorBase* opTensorBase = 
getLayer()->getOutputTensor(0); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); cudnnTensorDescriptor_t* desc = 
getDescriptor(opTensor->getSourcePortIndex()); assert(desc); 
cudnnTensorDescriptor_t ipDesc = 
MWCNNLayerImpl::getCuDNNDescriptor(ipTensorBase); 
CUDNN_CALL(cudnnActivationForward(*cQBKlCKXxecGPJrXBXdk->getCudnnHandle(), 
muwRQxtWMMXAPxSuMYBw, getOnePtr(), ipDesc, ipTensor->getData(), getZeroPtr(), 
*desc, opTensor->getData())); } void MWReLULayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyActivationDescriptor(muwRQxtWMMXAPxSuMYBw)); } } 