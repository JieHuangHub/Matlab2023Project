/* Copyright 2020-2022 The MathWorks, Inc. */

#include "MWInputLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

// Creating the ImageInputLayer
void MWInputLayer::createInputLayer(MWTargetNetworkImplBase* ntwk_impl,
                                    MWTensorBase* m_in,
                                    const char* outFormat,
                                    int outbufIdx) {
    // input format is same as output format
    m_in->setDataFormat(outFormat);
    setInputTensor(m_in);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createInputLayerImpl(this, ntwk_impl);
}

void MWInputLayer::propagateSize() {
    resizeOutputTensor(getInputTensor(0)->getHeight(), getInputTensor(0)->getWidth(),
                       getInputTensor(0)->getChannels(), getInputTensor(0)->getBatchSize(),
                       getInputTensor(0)->getSequenceLength());

    assert(getOutputTensor()->getSequenceLength() == 1);

    m_impl->propagateSize();
}
