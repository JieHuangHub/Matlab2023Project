#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWLayerImplFactory.hpp"
#include "layer/MWCNNLayerImplBase.hpp"
#else
#include "MWLayerImplFactory.hpp"
#include "MWCNNLayerImplBase.hpp"
#endif
#include "MWCudnnLayerImplFactory.hpp"
#include "MWCudnnCNNLayerImpl.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
 class MWCNNLayer;
#ifndef CREATE_INPUT_LAYER_IMPL_DEFINITION
#define CREATE_INPUT_LAYER_IMPL_DEFINITION

#include "MWCudnnInputLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createInputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWCudnnTarget::MWInputLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2));
}

#endif

#ifndef CREATE_FC_LAYER_IMPL_DEFINITION
#define CREATE_FC_LAYER_IMPL_DEFINITION

#include "MWCudnnFCLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createFCLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2,
int arg3,
int arg4,
const char* arg5,
const char* arg6) {
return new MWCudnnTarget::MWFCLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6);
}

#endif

#ifndef CREATE_RELU_LAYER_IMPL_DEFINITION
#define CREATE_RELU_LAYER_IMPL_DEFINITION

#include "MWCudnnReLULayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createReLULayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWCudnnTarget::MWReLULayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2));
}

#endif

#ifndef CREATE_TANH_LAYER_IMPL_DEFINITION
#define CREATE_TANH_LAYER_IMPL_DEFINITION

#include "MWCudnnTanhLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createTanhLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWCudnnTarget::MWTanhLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2));
}

#endif

#ifndef CREATE_ELEMENTWISEAFFINE_LAYER_IMPL_DEFINITION
#define CREATE_ELEMENTWISEAFFINE_LAYER_IMPL_DEFINITION

#include "MWCudnnElementwiseAffineLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createElementwiseAffineLayerImpl(MWCNNLayer* arg1,
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
const char* arg13) {
return new MWCudnnTarget::MWElementwiseAffineLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2),
arg3,
arg4,
arg5,
arg6,
arg7,
arg8,
arg9,
arg10,
arg11,
arg12,
arg13);
}

#endif

#ifndef CREATE_OUTPUT_LAYER_IMPL_DEFINITION
#define CREATE_OUTPUT_LAYER_IMPL_DEFINITION

#include "MWCudnnOutputLayerImpl.hpp"
MWCNNLayerImplBase* MWCudnnLayerImplFactory::createOutputLayerImpl(MWCNNLayer* arg1,
MWTargetNetworkImplBase* arg2) {
return new MWCudnnTarget::MWOutputLayerImpl(arg1,
static_cast<MWCudnnTarget::MWTargetNetworkImpl*>(arg2));
}

#endif
