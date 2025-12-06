/* Copyright 2019-2022 The MathWorks, Inc. */

// cuDNN specific header for Custom Layer Base Class
#ifndef MW_CUDNN_CUSTOM_LAYER_BASE
#define MW_CUDNN_CUSTOM_LAYER_BASE

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWCNNLayer.hpp"
#include "layer/shared_layers_export_macros.hpp"
#else
#include "MWCNNLayer.hpp"
#include "shared_layers_export_macros.hpp"
#endif

#include "cudnn.h"
#include <map>

class MWTensorBase;

namespace MWCudnnTarget {
class MWTargetNetworkImpl;
}

class DLCODER_EXPORT_CLASS MWCudnnCustomLayerBase : public MWCNNLayer {

  public:
    MWCudnnCustomLayerBase();
    ~MWCudnnCustomLayerBase();

    MWCudnnTarget::MWTargetNetworkImpl* m_ntwkImpl;

    void allocate();
    void deallocate();
    void cleanup();

  protected:
    void setupLayer(MWCudnnTarget::MWTargetNetworkImpl*);

    // needs to be invoked from propagateSize() call
    // only for the tensors that need permutation between NCHW <--> NCWH or NCHW <--> NHWC
    void setupInputDescriptors(MWTensorBase* aTensor,
                               MWTensorBase::DIMSLABEL srcLayout[],
                               MWTensorBase::DIMSLABEL implLayout[]);
    void setupOutputDescriptors(MWTensorBase* aTensor,
                                MWTensorBase::DIMSLABEL implLayout[],
                                MWTensorBase::DIMSLABEL destLayout[]);

    // reorder data to between SNCHW <--> SNCWH or SNCHW <--> SNHWC
    void reorderInputData(MWTensorBase* aTensor, int bufIndex);
    void reorderOutputData(MWTensorBase* aTensor, int bufIndex);

    virtual void cleanupLayer(){};

  private:
    // descriptors for input and output tensor data
    std::map<MWTensorBase*, cudnnTensorDescriptor_t*> m_inOutDescriptor;

    // descriptors for workspace data that holds the permuted/transformed data for the input and
    // output tensors
    std::map<MWTensorBase*, cudnnTensorDescriptor_t*> m_inOutTransformDescriptor;

    void createInOutDescriptors(MWTensorBase* aTensor);
    void createInOutTransformDescriptors(MWTensorBase* aTensor);
};

#endif
