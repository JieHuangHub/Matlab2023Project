/* Copyright 2018-2022 The MathWorks, Inc. */

// Target Agnostic implementation for Keras's Tanh Layer
#include "MWTanhLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

MWTanhLayer::MWTanhLayer() {
}

MWTanhLayer::~MWTanhLayer() {
}

void MWTanhLayer::createTanhLayer(MWTargetNetworkImplBase* ntwk_impl,
                                  MWTensorBase* dataInput,
                                  const char* outFormat,
                                  int outbufIdx) {
    setInputTensor(dataInput);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createTanhLayerImpl(this, ntwk_impl);
}

void MWTanhLayer::propagateSize() {
    resizeOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(),
                       getInputTensor()->getChannels(), getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    m_impl->propagateSize();
}
