//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: evaluatePolicy_internal_types.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

#ifndef EVALUATEPOLICY_INTERNAL_TYPES_H
#define EVALUATEPOLICY_INTERNAL_TYPES_H

// Include Files
#include "evaluatePolicy_types.h"
#include "rtwtypes.h"
#include "MWCNNLayer.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWTensorBase.hpp"

// Type Definitions
class model0_0 {
public:
  model0_0();
  void setSize();
  void resetState();
  void setup();
  void activations(int layerIdx);
  void cleanup();
  float *getLayerOutput(int layerIndex, int portIndex);
  int getLayerOutputSize(int layerIndex, int portIndex);
  float *getInputDataPointer(int b_index);
  float *getInputDataPointer();
  float *getOutputDataPointer(int b_index);
  float *getOutputDataPointer();
  int getBatchSize();
  int getOutputSequenceLength(int layerIndex, int portIndex);
  ~model0_0();

private:
  void allocate();
  void postsetup();
  void deallocate();

public:
  boolean_T isInitialized;
  boolean_T matlabCodegenIsDeleted;

private:
  int numLayers;
  MWTensorBase *inputTensors[1];
  MWTensorBase *outputTensors[1];
  MWCNNLayer *layers[9];
  MWCudnnTarget::MWTargetNetworkImpl *targetImpl;
};

#endif
//
// File trailer for evaluatePolicy_internal_types.h
//
// [EOF]
//
