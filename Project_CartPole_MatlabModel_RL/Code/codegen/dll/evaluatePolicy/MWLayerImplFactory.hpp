/* Copyright 2021-2022 The MathWorks, Inc. */
#ifndef MW_LAYER_IMPL_FACTORY
#define MW_LAYER_IMPL_FACTORY

#include "MWActivationFunctionType.hpp" // for createFusedConvActivationLayerImpl()
#include "MWRNNParameterTypes.hpp"      // for createRNNLayerImpl()

#include <cassert>

/* This base class layerImpl factory has base createLayerImpl methods that should never be invoked.
 * They are essentially pure virtual functions, but they cannot be declared pure virtual since
 * we cannot guarantee that they will be overridden by the derived target-specific layer impl
 * factory. The reason for this is that we auto-emit only the createLayerImpl definitions and
 * declarations that correspond to layers in the codegen network(s). Emitting the other definitions
 * is unnecessary, and would also require that the unused layerImpl class definitions be packaged in
 * the codegen folder as well, increasing compilation time unnecessarily. */

class MWCNNLayerImplBase;
class MWTargetNetworkImplBase;
class MWCNNLayer;

class MWLayerImplFactory {

  public:
    MWLayerImplFactory() {}
    virtual ~MWLayerImplFactory() {}

    virtual MWCNNLayerImplBase* createAdditionLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createAvgPoolingLayerImpl(MWCNNLayer*,
                                                          MWTargetNetworkImplBase*,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int, 
                                                          bool) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createBatchNormalizationLayerImpl(MWCNNLayer*,
                                                                  MWTargetNetworkImplBase*,
                                                                  float,
                                                                  const char*,
                                                                  const char*,
                                                                  const char*,
                                                                  const char*,
                                                                  int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createBfpRescaleLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createBfpScaleLayerImpl(MWCNNLayer*,
                                                        MWTargetNetworkImplBase*,
                                                        bool) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createClippedReLULayerImpl(MWCNNLayer*,
                                                           MWTargetNetworkImplBase*,
                                                           float) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createConcatenationLayerImpl(MWCNNLayer*,
                                                             MWTargetNetworkImplBase*,
                                                             int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createConvLayerImpl(MWCNNLayer*,
                                                    MWTargetNetworkImplBase*,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    int,
                                                    const char*,
                                                    const char*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createCrop2dLayerImpl(MWCNNLayer*,
                                                      MWTargetNetworkImplBase*,
                                                      int,
                                                      int,
                                                      bool) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createElementwiseAffineLayerImpl(MWCNNLayer*,
                                                                 MWTargetNetworkImplBase*,
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
                                                                 const char*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createELULayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*, double) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createExponentialLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createFCLayerImpl(MWCNNLayer*,
                                                  MWTargetNetworkImplBase*,
                                                  int,
                                                  int,
                                                  const char*,
                                                  const char*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createFlattenLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createFlattenCStyleLayerImpl(MWCNNLayer*,
                                                             MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createFusedConvActivationLayerImpl(
        MWCNNLayer*,
        MWTargetNetworkImplBase*,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        int,
        const char*,
        const char*,
        double,
        MWActivationFunctionType::ACTIVATION_FCN_ENUM) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createInputLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    // There is no base class createInt8ConvolutionLayer since this method constructs a templatized
    // layer impl. The createLayer method is defined as a nonvirtual method on the appropriate
    // derived layer impl factory classes.

    virtual MWCNNLayerImplBase* createInt8DataReorderLayerImpl(MWCNNLayer*,
                                                               MWTargetNetworkImplBase*,
                                                               bool,
                                                               int,
                                                               int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createLeakyReLULayerImpl(MWCNNLayer*,
                                                         MWTargetNetworkImplBase*,
                                                         float) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createMaxPoolingLayerImpl(MWCNNLayer*,
                                                          MWTargetNetworkImplBase*,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          int,
                                                          bool,
                                                          int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createMaxUnpoolingLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createNormLayerImpl(MWCNNLayer*,
                                                    MWTargetNetworkImplBase*,
                                                    unsigned,
                                                    float,
                                                    float,
                                                    float) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createOutputLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createPassthroughLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createReLULayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createRNNLayerImpl(MWCNNLayer*,
                                                   MWTargetNetworkImplBase*,
                                                   int,
                                                   int,
                                                   int,
                                                   int,
                                                   bool,
                                                   bool,
                                                   MWRNNParameter::RNNMode,
                                                   MWRNNParameter::RNNBiasMode,
                                                   MWRNNParameter::StateActEnum,
                                                   MWRNNParameter::GateActEnum,
                                                   const char*,
                                                   const char*,
                                                   const char*,
                                                   const char*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createRowMajorFlattenLayerImpl(MWCNNLayer*,
                                                               MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createScalingLayerImpl(MWCNNLayer*,
                                                       MWTargetNetworkImplBase*,
                                                       float,
                                                       float) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createSequenceFoldingLayerImpl(MWCNNLayer*,
                                                               MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createSequenceInputLayerImpl(MWCNNLayer*,
                                                             MWTargetNetworkImplBase*,
                                                             bool) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createSequenceUnfoldingLayerImpl(MWCNNLayer*,
                                                                 MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createSigmoidLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createSoftmaxLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createSplittingLayerImpl(MWCNNLayer*,
                                                         MWTargetNetworkImplBase*,
                                                         int,
                                                         int*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createSSDMergeLayerImpl(MWCNNLayer*,
                                                        MWTargetNetworkImplBase*,
                                                        int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createTanhLayerImpl(MWCNNLayer*, MWTargetNetworkImplBase*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createTransposedConvolution2DLayerImpl(MWCNNLayer*,
                                                                       MWTargetNetworkImplBase*,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       int,
                                                                       const char*,
                                                                       const char*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createWordEmbeddingLayerImpl(MWCNNLayer*,
                                                             MWTargetNetworkImplBase*,
                                                             int,
                                                             int,
                                                             const char*) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createYoloExtractionLayerImpl(MWCNNLayer*,
                                                              MWTargetNetworkImplBase*,
                                                              int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createYoloReorg2dLayerImpl(MWCNNLayer*,
                                                           MWTargetNetworkImplBase*,
                                                           int,
                                                           int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createYoloSoftmaxLayerImpl(MWCNNLayer*,
                                                           MWTargetNetworkImplBase*,
                                                           int) {
        assert(false);
        return 0;
    }

    virtual MWCNNLayerImplBase* createZeroPaddingLayerImpl(MWCNNLayer*,
                                                           MWTargetNetworkImplBase*,
                                                           int,
                                                           int,
                                                           int,
                                                           int) {
        assert(false);
        return 0;
    }
};

#endif
