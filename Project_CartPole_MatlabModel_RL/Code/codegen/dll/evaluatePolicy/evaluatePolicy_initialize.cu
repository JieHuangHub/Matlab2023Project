//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: evaluatePolicy_initialize.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

// Include Files
#include "evaluatePolicy_initialize.h"
#include "evaluatePolicy.h"
#include "evaluatePolicy_data.h"

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void evaluatePolicy_initialize()
{
  evaluatePolicy_init();
  cudaGetLastError();
  isInitialized_evaluatePolicy = true;
}

//
// File trailer for evaluatePolicy_initialize.cu
//
// [EOF]
//
