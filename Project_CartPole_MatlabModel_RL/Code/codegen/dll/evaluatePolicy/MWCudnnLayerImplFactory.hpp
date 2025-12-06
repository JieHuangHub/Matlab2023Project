/* Copyright 2021-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_LAYER_IMPL_FACTORY
#define MW_CUDNN_LAYER_IMPL_FACTORY

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWLayerImplFactory.hpp"
#else
#include "MWLayerImplFactory.hpp"
#endif

class MWCNNLayerImplBase;

class MWCudnnLayerImplFactory : public MWLayerImplFactory {

  public:
    MWCudnnLayerImplFactory() {
    }
    virtual ~MWCudnnLayerImplFactory() {
    }

    // auto-emit createLayerImpl declarations here

#ifndef CREATE_INPUT_LAYER_IMPL_DECLARATION
#define CREATE_INPUT_LAYER_IMPL_DECLARATION

MWCNNLayerImplBase* createInputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2);


#endif

#ifndef CREATE_FC_LAYER_IMPL_DECLARATION
#define CREATE_FC_LAYER_IMPL_DECLARATION

MWCNNLayerImplBase* createFCLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
const char* arg5,
const char* arg6);


#endif

#ifndef CREATE_RELU_LAYER_IMPL_DECLARATION
#define CREATE_RELU_LAYER_IMPL_DECLARATION

MWCNNLayerImplBase* createReLULayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2);


#endif

#ifndef CREATE_TANH_LAYER_IMPL_DECLARATION
#define CREATE_TANH_LAYER_IMPL_DECLARATION

MWCNNLayerImplBase* createTanhLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2);


#endif

#ifndef CREATE_ELEMENTWISEAFFINE_LAYER_IMPL_DECLARATION
#define CREATE_ELEMENTWISEAFFINE_LAYER_IMPL_DECLARATION

MWCNNLayerImplBase* createElementwiseAffineLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
int arg5,
int arg6,
int arg7,
int arg8,
bool arg9,
int arg10,
int arg11,
const char* arg12,
const char* arg13);


#endif

#ifndef CREATE_OUTPUT_LAYER_IMPL_DECLARATION
#define CREATE_OUTPUT_LAYER_IMPL_DECLARATION

MWCNNLayerImplBase* createOutputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2);


#endif
};
#endif