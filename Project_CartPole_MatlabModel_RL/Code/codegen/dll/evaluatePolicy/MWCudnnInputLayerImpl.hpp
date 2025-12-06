/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_INPUT_LAYER_IMPL
#define MW_CUDNN_INPUT_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

class MWCNNLayer;

namespace MWCudnnTarget {

class MWTargetNetworkImpl;

class MWInputLayerImpl : public MWCNNLayerImpl {
  public:
    MWInputLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* ntwk_impl)
        : MWCNNLayerImpl(layer, ntwk_impl) {
    }

    ~MWInputLayerImpl() {
    }

    void predict() {
    }
    void cleanup() {
    }
    void propagateSize() {
    }
};

} // namespace MWCudnnTarget

#endif
