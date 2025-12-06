/* Copyright 2018-2022 The MathWorks, Inc. */

// Target Specific (cudnn) header for Keras' Tanh Layer
#ifndef MW_CUDNN_TANH_LAYER_IMPL
#define MW_CUDNN_TANH_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

/**
 *  Codegen class for Keras Tanh Layer
 **/
class MWCNNLayer;

namespace MWCudnnTarget {
class MWTargetNetworkImpl;
class MWTanhLayerImpl : public MWCNNLayerImpl {
  public:
    MWTanhLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*);
    ~MWTanhLayerImpl();

    void predict();
    void cleanup();
    void propagateSize();

  private:
    cudnnActivationDescriptor_t rkzbRnJPJHmyWmkoOrFj;
};
} // namespace MWCudnnTarget
#endif
