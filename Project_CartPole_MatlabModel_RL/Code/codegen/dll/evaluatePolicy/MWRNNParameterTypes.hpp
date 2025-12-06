/* Copyright 2021-2022 The MathWorks, Inc. */
#ifndef MW_RNN_PARAMETER_TYPES
#define MW_RNN_PARAMETER_TYPES

namespace MWRNNParameter {
enum RNNMode { LSTM = 0, GRU };
enum RNNBiasMode { SINGLE_INPUT_BIAS = 0, DOUBLE_BIAS };
enum GRUMultiplicationMode { AFTER = 0, BEFORE };
enum StateActEnum { TANH = 0, SOFTSIGN };
enum GateActEnum { SIGMOID = 0, HARD_SIGMOID };
} // namespace MWRNNParameter

#endif
