/* Copyright 2021-2022 The MathWorks, Inc. */
#ifndef MW_ACTIVATION_FUNCTION_TYPE
#define MW_ACTIVATION_FUNCTION_TYPE

namespace MWActivationFunctionType {
enum ACTIVATION_FCN_ENUM {
    IDENTITY = 0,
    RELU,
    CLIPPED_RELU,
    LEAKY_RELU,
    ELU,
    SIGMOID,
    TANH,
    INVALID_ACTIVATION
};
}

#endif
