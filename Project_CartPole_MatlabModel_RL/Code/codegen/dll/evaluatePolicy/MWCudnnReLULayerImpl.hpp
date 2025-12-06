/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_RELU_LAYER_IMPL
#define MW_CUDNN_RELU_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

class MWCNNLayer;

namespace MWCudnnTarget {
class MWTargetNetworkImpl;

// ReLULayer
class MWReLULayerImpl : public MWCNNLayerImpl {
  public:
    MWReLULayerImpl(MWCNNLayer*, MWTargetNetworkImpl*);
    ~MWReLULayerImpl();

    void predict();
    void cleanup();
    void propagateSize();

  private:
    cudnnActivationDescriptor_t muwRQxtWMMXAPxSuMYBw;
};

} // namespace MWCudnnTarget
#endif
