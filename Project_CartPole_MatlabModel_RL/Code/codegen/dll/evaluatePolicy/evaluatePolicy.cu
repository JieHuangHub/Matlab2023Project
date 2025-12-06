//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: evaluatePolicy.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

// Include Files
#include "evaluatePolicy.h"
#include "dlnetwork.h"
#include "evaluatePolicy_data.h"
#include "evaluatePolicy_initialize.h"
#include "evaluatePolicy_internal_types.h"
#include "predict.h"
#include "MWCudaDimUtility.hpp"
#include <cmath>

// Type Definitions
namespace coder {
namespace rl {
namespace codegen {
namespace policy {
namespace internal {
struct SaturationActionBounder {
  double UpperLimits_[1];
  double LowerLimits_[1];
};

} // namespace internal
} // namespace policy
} // namespace codegen
} // namespace rl
struct dlarray {
  float Data;
};

namespace rl {
namespace codegen {
namespace model {
struct DLNetworkModel {
  boolean_T matlabCodegenIsDeleted;
  int isInitialized;
  boolean_T isSetupComplete;
  model0_0 *InternalNetwork_;
};

} // namespace model
namespace policy {
struct rlDeterministicActorPolicy {
  boolean_T matlabCodegenIsDeleted;
  int isInitialized;
  boolean_T isSetupComplete;
  model::DLNetworkModel *Model_;
  internal::SaturationActionBounder ActionBounder_;
};

} // namespace policy
} // namespace codegen
} // namespace rl
} // namespace coder

// Variable Definitions
static coder::rl::codegen::model::DLNetworkModel gobj_2;

static model0_0 gobj_1;

static coder::rl::codegen::policy::rlDeterministicActorPolicy policy;

static boolean_T policy_not_empty;

// Function Declarations
static __global__ void
evaluatePolicy_kernel1(float observation1[5], double observation1_dim0,
                       double observation1_dim1, double observation1_dim2,
                       double observation1_dim3, double observation1_dim4);

// Function Definitions
//
// Arguments    : dim3 blockArg
//                dim3 gridArg
//                float observation1[5]
//                double observation1_dim0
//                double observation1_dim1
//                double observation1_dim2
//                double observation1_dim3
//                double observation1_dim4
// Return Type  : void
//
static __global__ __launch_bounds__(32, 1) void evaluatePolicy_kernel1(
    float observation1[5], double observation1_dim0, double observation1_dim1,
    double observation1_dim2, double observation1_dim3,
    double observation1_dim4)
{
  __shared__ double observation1_shared[5];
  unsigned long threadId;
  int i;
  if (mwGetThreadIndexWithinBlock() == 0) {
    observation1_shared[0] = observation1_dim0;
    observation1_shared[1] = observation1_dim1;
    observation1_shared[2] = observation1_dim2;
    observation1_shared[3] = observation1_dim3;
    observation1_shared[4] = observation1_dim4;
  }
  __syncthreads();
  threadId = static_cast<unsigned long>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int>(threadId);
  if (i < 5) {
    observation1[i] = static_cast<float>(observation1_shared[i]);
  }
}

//
// Reinforcement Learning Toolbox
//  Generated on: 2025-11-06 16:07:00
//
// Arguments    : const double observation1[5]
// Return Type  : double
//
double evaluatePolicy(const double observation1[5])
{
  model0_0 *net;
  coder::dlarray dlArrayOutputs[1];
  double action1;
  float(*gpu_observation1)[5];
  if (!isInitialized_evaluatePolicy) {
    evaluatePolicy_initialize();
  }
  cudaMalloc(&gpu_observation1, 20UL);
  if (!policy_not_empty) {
    coder::internal::dlnetwork_setup(&gobj_1);
    gobj_1.matlabCodegenIsDeleted = false;
    gobj_2.InternalNetwork_ = &gobj_1;
    gobj_2.matlabCodegenIsDeleted = false;
    gobj_2.isInitialized = 1;
    gobj_2.isSetupComplete = true;
    policy.ActionBounder_.UpperLimits_[0] = 15.0;
    policy.ActionBounder_.LowerLimits_[0] = -15.0;
    policy.Model_ = &gobj_2;
    policy.matlabCodegenIsDeleted = false;
    policy.isInitialized = 1;
    policy.isSetupComplete = true;
    policy_not_empty = true;
  }
  //  evaluate the policy
  net = policy.Model_->InternalNetwork_;
  evaluatePolicy_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
      *gpu_observation1, observation1[0], observation1[1], observation1[2],
      observation1[3], observation1[4]);
  dlArrayOutputs[0].Data =
      coder::internal::dlnetwork_predict(net, *gpu_observation1);
  action1 = std::fmax(std::fmin(static_cast<double>(dlArrayOutputs[0].Data),
                                policy.ActionBounder_.UpperLimits_[0]),
                      policy.ActionBounder_.LowerLimits_[0]);
  cudaFree(*gpu_observation1);
  return action1;
}

//
// Reinforcement Learning Toolbox
//  Generated on: 2025-11-06 16:07:00
//
// Arguments    : void
// Return Type  : void
//
void evaluatePolicy_delete()
{
  if (!policy.matlabCodegenIsDeleted) {
    policy.matlabCodegenIsDeleted = true;
    if (policy.isInitialized == 1) {
      policy.isInitialized = 2;
    }
  }
  if (!gobj_2.matlabCodegenIsDeleted) {
    gobj_2.matlabCodegenIsDeleted = true;
    if (gobj_2.isInitialized == 1) {
      gobj_2.isInitialized = 2;
    }
  }
  if (!gobj_1.matlabCodegenIsDeleted) {
    gobj_1.matlabCodegenIsDeleted = true;
    coder::internal::dlnetwork_delete(&gobj_1);
  }
}

//
// Reinforcement Learning Toolbox
//  Generated on: 2025-11-06 16:07:00
//
// Arguments    : void
// Return Type  : void
//
void evaluatePolicy_init()
{
  policy_not_empty = false;
  gobj_1.matlabCodegenIsDeleted = true;
  gobj_2.matlabCodegenIsDeleted = true;
  policy.matlabCodegenIsDeleted = true;
}

//
// File trailer for evaluatePolicy.cu
//
// [EOF]
//
