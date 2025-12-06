//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: _coder_evaluatePolicy_api.h
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

#ifndef _CODER_EVALUATEPOLICY_API_H
#define _CODER_EVALUATEPOLICY_API_H

// Include Files
#include "evaluatePolicy_spec.h"
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"
#include <algorithm>
#include <cstring>

// Variable Declarations
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

// Function Declarations
real_T evaluatePolicy(real_T observation1[5]);

void evaluatePolicy_api(const mxArray *const prhs[1], const mxArray *plhs[1]);

void evaluatePolicy_atexit();

void evaluatePolicy_initialize();

void evaluatePolicy_terminate();

void evaluatePolicy_xil_shutdown();

void evaluatePolicy_xil_terminate();

#endif
//
// File trailer for _coder_evaluatePolicy_api.h
//
// [EOF]
//
