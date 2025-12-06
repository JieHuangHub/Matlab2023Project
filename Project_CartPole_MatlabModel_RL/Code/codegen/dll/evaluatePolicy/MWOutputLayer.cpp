/* Copyright 2020-2022 The MathWorks, Inc. */

#include "MWOutputLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWTensor.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

// Create ClassificationOutputLayer
// We are doing inference only so LossFunction is not needed.
// This layer would do nothing but point the data to previous layer.
void MWOutputLayer::createOutputLayer(MWTargetNetworkImplBase* ntwk_impl,
                                      MWTensorBase* m_in,
                                      const char* outFormat,
                                      int outbufIdx) {
    setInputTensor(m_in);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createOutputLayerImpl(this, ntwk_impl);
}

void MWOutputLayer::propagateSize() {
    resizeOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(),
                       getInputTensor()->getChannels(), getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());
    m_impl->propagateSize();
}

void MWOutputLayer::predict() {
    m_impl->predict();
}
