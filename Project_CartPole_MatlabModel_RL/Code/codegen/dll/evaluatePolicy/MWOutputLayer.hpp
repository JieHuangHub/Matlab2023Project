/* Copyright 2020-2022 The MathWorks, Inc. */
#ifndef MW_OUTPUT_LAYER
#define MW_OUTPUT_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

// ClassificationOutputLayer
class DLCODER_EXPORT_CLASS MWOutputLayer
    : public MWCNNLayer { // used in MWMkldnnTargetNetworkImpl in dynamic cast
  public:
    MWOutputLayer() {}
    ~MWOutputLayer() {}

    void createOutputLayer(MWTargetNetworkImplBase*, MWTensorBase*, const char*, int);
    void predict();
    void propagateSize();
};
#endif
