/* Copyright 2021-2022 The MathWorks, Inc. */
#ifndef MW_CNN_LAYER_IMPL_BASE
#define MW_CNN_LAYER_IMPL_BASE

#include <vector>

class MWCNNLayer;

class MWCNNLayerImplBase {

  public:
    MWCNNLayerImplBase(MWCNNLayer* layer)
        : MW_mangled_layer(layer) {}
    virtual ~MWCNNLayerImplBase() {}

    virtual void propagateSize() = 0;
    virtual void postSetup() = 0;
    virtual void predict() = 0;
    virtual void setLearnables(std::vector<float*>) = 0;
    virtual void resetState() = 0;
    virtual void updateState() = 0;
    virtual void cleanup() = 0;

  public:
    //// allocation and deallocation methods

    // allocate input data
    virtual void allocateInput(int) = 0;

    // allocate output data
    virtual void allocateOutput(int) = 0;

    // allocate auxiliary layer data
    virtual void allocate() = 0;

    // deallocate input data
    virtual void deallocateInput(int) = 0;

    // deallocate output data
    virtual void deallocateOutput(int) = 0;

    // deallocate auxiliary layer data
    virtual void deallocate() = 0;

  public:
    MWCNNLayer* getLayer() {
        return MW_mangled_layer;
    }

  private:
    MWCNNLayer* MW_mangled_layer;
};

#endif
