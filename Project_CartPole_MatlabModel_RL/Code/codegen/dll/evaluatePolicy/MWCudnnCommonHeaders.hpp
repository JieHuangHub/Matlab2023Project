/* Copyright 2021-2022 The MathWorks, Inc. */

/* Include this in cudnn layer files that call into CuDNN APIs. If a layer does not call into CuDNN APIs, it should not include this header, as it will probably not need to include MWCudnnTargetNetworkImpl.hpp (it should suffice to forward declare the class instead). */

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWCNNLayer.hpp"
#include "layer/MWTensorBase.hpp"
#include "layer/MWTensor.hpp"
#else
#include "MWCNNLayer.hpp"
#include "MWTensorBase.hpp"
#include "MWTensor.hpp"
#endif

#include "MWCudnnCNNLayerImpl.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
