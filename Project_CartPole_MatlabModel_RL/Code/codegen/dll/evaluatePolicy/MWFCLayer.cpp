/* Copyright 2020-2022 The MathWorks, Inc. */

#include "MWFCLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWLayerImplFactory.hpp"

#include <vector>

// Create FullyConnectedLayer with corresponding InputSize and OutputSize.
// This implementation uses SGEMV for m_BatchSize = 1 and SGEMM for others.
void MWFCLayer::createFCLayer(MWTargetNetworkImplBase* ntwk_impl,
                              MWTensorBase* m_in,
                              int m_InputSize,
                              int m_OutputSize,
                              const char* m_weights_file,
                              const char* m_bias_file,
                              const char* m_outFormat,
                              int outbufIdx) {
    numInputFeatures = m_InputSize;
    numOutputFeatures = m_OutputSize;

    setInputTensor(m_in);

    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, m_outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createFCLayerImpl(this, ntwk_impl, m_InputSize, m_OutputSize, m_weights_file,
                                        m_bias_file);
}

void MWFCLayer::propagateSize() {
    resizeOutputTensor(1, 1, numOutputFeatures, getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    m_impl->propagateSize();
}

void MWFCLayer::setLearnables(float* m_weights, float* m_bias) {
    std::vector<float*> learnables;
    learnables.reserve(2);
    learnables.push_back(m_weights);
    learnables.push_back(m_bias);
    m_impl->setLearnables(learnables);
}
