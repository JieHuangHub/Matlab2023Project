/* Copyright 2018-2022 The MathWorks, Inc. */

// Target Agnostic header for Keras' Tanh Layer
#ifndef MW_TANH_LAYER
#define MW_TANH_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

/**
 * Codegen class for Keras Tanh Layer
 **/
class DLCODER_EXPORT_CLASS MWTanhLayer : public MWCNNLayer {
  public:
    MWTanhLayer();
    ~MWTanhLayer();

    /** Create a new Tanh Layer */
    void createTanhLayer(MWTargetNetworkImplBase*, MWTensorBase*, const char*, int);
    void propagateSize();
};
#endif
