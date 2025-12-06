//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: evaluatePolicy_terminate.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

// Include Files
#include "evaluatePolicy_terminate.h"
#include "evaluatePolicy.h"
#include "evaluatePolicy_data.h"
#include "stdio.h"

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void evaluatePolicy_terminate()
{
  cudaError_t errCode;
  errCode = cudaGetLastError();
  if (errCode != cudaSuccess) {
    fprintf(stderr, "ERR[%d] %s:%s\n", errCode, cudaGetErrorName(errCode),
            cudaGetErrorString(errCode));
    exit(errCode);
  }
  evaluatePolicy_delete();
  isInitialized_evaluatePolicy = false;
}

//
// File trailer for evaluatePolicy_terminate.cu
//
// [EOF]
//
