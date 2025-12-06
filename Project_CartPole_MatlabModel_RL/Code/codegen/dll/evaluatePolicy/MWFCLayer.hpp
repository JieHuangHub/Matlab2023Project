/* Copyright 2020-2022 The MathWorks, Inc. */

#ifndef MW_FC_LAYER
#define MW_FC_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

// FullyConnectedLayer
class DLCODER_EXPORT_CLASS MWFCLayer : public MWCNNLayer {
  public:
    MWFCLayer() {}
    ~MWFCLayer() {}

    void createFCLayer(MWTargetNetworkImplBase*,
                       MWTensorBase*,
                       int,
                       int,
                       const char*,
                       const char*,
                       const char*,
                       int);
    void propagateSize();
    void setLearnables(float*, float*);

  private:
    int numInputFeatures;
    int numOutputFeatures;
};

#endif
