/* Copyright 2018-2022 The MathWorks, Inc. */

#include "MWElementwiseAffineLayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

#include <cstdio>
#include <cassert>

MWElementwiseAffineLayer::MWElementwiseAffineLayer() {
}

MWElementwiseAffineLayer::~MWElementwiseAffineLayer() {
}

void MWElementwiseAffineLayer::createElementwiseAffineLayer(MWTargetNetworkImplBase* ntwk_impl,
                                                            MWTensorBase* m_in,
                                                            int m_scaleH,
                                                            int m_scaleW,
                                                            int m_scaleC,
                                                            int m_offsetH,
                                                            int m_offsetW,
                                                            int m_offsetC,
                                                            bool m_isClipped,
                                                            int m_lowerBound,
                                                            int m_upperBound,
                                                            const char* m_scale_file,
                                                            const char* m_offset_file,
                                                            const char* m_outFormat,
                                                            int outbufIdx) {
    setInputTensor(m_in);
    allocateOutputTensor<float>(-1, -1, -1, -1, -1, NULL, m_outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);

    scaleH = m_scaleH;
    scaleW = m_scaleW;
    scaleC = m_scaleC;
    offsetH = m_offsetH;
    offsetW = m_offsetW;
    offsetC = m_offsetC;
    isClipped = m_isClipped;
    lowerBound = m_lowerBound;
    upperBound = m_upperBound;

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createElementwiseAffineLayerImpl(
        this, ntwk_impl, m_scaleH, m_scaleW, m_scaleC, m_offsetH, m_offsetW, m_offsetC, m_isClipped,
        m_lowerBound, m_upperBound, m_scale_file, m_offset_file);
}

void MWElementwiseAffineLayer::propagateSize() {
    resizeOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(),
                       getInputTensor()->getChannels(), getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    m_impl->propagateSize();
}
