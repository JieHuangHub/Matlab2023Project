/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_OUTPUT_LAYER_IMPL
#define MW_CUDNN_OUTPUT_LAYER_IMPL

#include "MWCudnnCNNLayerImpl.hpp"

class MWCNNLayer;

namespace MWCudnnTarget {

class MWTargetNetworkImpl;

class MWOutputLayerImpl : public MWCNNLayerImpl {
  public:
    MWOutputLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*);
    ~MWOutputLayerImpl();

    void deallocateOutputData(int);
    void propagateSize();
    void predict();
    void cleanup();
};

} // namespace MWCudnnTarget

#endif
