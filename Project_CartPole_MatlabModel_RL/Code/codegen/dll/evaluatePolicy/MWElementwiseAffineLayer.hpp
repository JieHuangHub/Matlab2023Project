/* Copyright 2017-2022 The MathWorks, Inc. */

#ifndef MW_ELEMENTWISE_AFFINE_LAYER
#define MW_ELEMENTWISE_AFFINE_LAYER

#include "MWCNNLayer.hpp"

#include "shared_layers_export_macros.hpp"

class MWTargetNetworkImplBase;
class MWTensorBase;

class DLCODER_EXPORT_CLASS MWElementwiseAffineLayer : public MWCNNLayer {
  private:
  public:
    MWElementwiseAffineLayer();
    ~MWElementwiseAffineLayer();
    void createElementwiseAffineLayer(MWTargetNetworkImplBase*,
                                      MWTensorBase*,
                                      int,
                                      int,
                                      int,
                                      int,
                                      int,
                                      int,
                                      bool,
                                      int,
                                      int,
                                      const char*,
                                      const char*,
                                      const char*,
                                      int);
    void propagateSize();

  private:
    int scaleH;
    int scaleW;
    int scaleC;
    int offsetH;
    int offsetW;
    int offsetC;
    int isClipped;
    int lowerBound;
    int upperBound;
};
#endif
