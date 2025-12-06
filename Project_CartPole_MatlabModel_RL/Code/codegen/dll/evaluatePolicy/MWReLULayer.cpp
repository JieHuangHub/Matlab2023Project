/* Copyright 2020-2022 The MathWorks, Inc. */

#include "MWTensorBase.hpp"
#include "MWCNNLayer.hpp"
#include "MWReLULayer.hpp"
#include "MWCNNLayerImplBase.hpp"
#include "MWTargetNetworkImplBase.hpp"
#include "MWLayerImplFactory.hpp"

#include "shared_layers_export_macros.hpp"

#include <cmath>
// Create ReLULayer
// Template type T1 is the input data type and will always be signed char or float
// Template type T2 is the output data type and this can be either signed char or float

template DLCODER_EXPORT_CLASS void MWReLULayer::createReLULayer<signed char, signed char>(MWTargetNetworkImplBase*,
                                                                     MWTensorBase*,
                                                                     int,
                                                                     const char*,
                                                                     int,
                                                                     const char*,
                                                                     int);

template DLCODER_EXPORT_CLASS void MWReLULayer::createReLULayer<float, float>(MWTargetNetworkImplBase*,
                                                         MWTensorBase*,
                                                         int,
                                                         const char*,
                                                         int,
                                                         const char*,
                                                         int);

template <typename T1, typename T2>
void MWReLULayer::createReLULayer(MWTargetNetworkImplBase* ntwk_impl,
                                  MWTensorBase* m_in,
                                  int m_scalingFactorAlpha1,
                                  const char* m_accelerationMode,
                                  int /*m_numOutputs*/,
                                  const char* outFormat,
                                  int outbufIdx) {
    setInputTensor(m_in);
    allocateOutputTensor<T2>(-1, -1, -1, -1, -1, NULL, outFormat);

    getOutputTensor(0)->setopBufIndex(outbufIdx);
    setAccelMode(m_accelerationMode);
    setScalingExponent(m_scalingFactorAlpha1);

    MWLayerImplFactory* factory = ntwk_impl->getLayerImplFactory();
    m_impl = factory->createReLULayerImpl(this, ntwk_impl);
}

void MWReLULayer::propagateSize() {
    bool isINT8x4 =
        getOutputTensor()->isInt8() && std::string{"INT8x4"}.compare(getAccelMode()) == 0;

    int mult4_featureMap =
        isINT8x4 ? static_cast<int>(std::ceil((float)getInputTensor()->getChannels() / 4) * 4)
                 : getInputTensor()->getChannels();

    resizeOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(),
                       mult4_featureMap, getInputTensor()->getBatchSize(),
                       getInputTensor()->getSequenceLength());

    m_impl->propagateSize();
}
