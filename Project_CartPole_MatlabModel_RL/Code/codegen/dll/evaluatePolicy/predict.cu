//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: predict.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

// Include Files
#include "predict.h"
#include "dlnetwork.h"
#include "evaluatePolicy_internal_types.h"

// Function Definitions
//
// Arguments    : model0_0 *obj
//                const float varargin_1_Data[5]
// Return Type  : float
//
namespace coder {
namespace internal {
float dlnetwork_predict(model0_0 *obj, const float varargin_1_Data[5])
{
  float cpu_varargout_1_Data;
  float *gpu_varargout_1_Data;
  cudaMalloc(&gpu_varargout_1_Data, 4UL);
  cudaMemcpy(obj->getInputDataPointer(0), varargin_1_Data,
             obj->getLayerOutputSize(0, 0), cudaMemcpyDeviceToDevice);
  obj->activations(8);
  cudaMemcpy(gpu_varargout_1_Data, obj->getLayerOutput(8, 0),
             obj->getLayerOutputSize(8, 0), cudaMemcpyDeviceToDevice);
  cudaMemcpy(&cpu_varargout_1_Data, gpu_varargout_1_Data, 4UL,
             cudaMemcpyDeviceToHost);
  cudaFree(gpu_varargout_1_Data);
  return cpu_varargout_1_Data;
}

} // namespace internal
} // namespace coder

//
// File trailer for predict.cu
//
// [EOF]
//
