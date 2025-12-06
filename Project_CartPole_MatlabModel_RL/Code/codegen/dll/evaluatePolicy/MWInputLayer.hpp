/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_INPUT_LAYER
#define MW_INPUT_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

// ImageInputLayer
class DLCODER_EXPORT_CLASS MWInputLayer : public MWCNNLayer {
  public:
    MWInputLayer() {}
    ~MWInputLayer() {}

    void createInputLayer(MWTargetNetworkImplBase* ntwk_impl, MWTensorBase* m_in, const char*, int);
    void propagateSize();
};
#endif
