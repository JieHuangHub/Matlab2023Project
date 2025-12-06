//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: _coder_evaluatePolicy_api.cpp
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

// Include Files
#include "_coder_evaluatePolicy_api.h"
#include "_coder_evaluatePolicy_mex.h"

// Variable Definitions
emlrtCTX emlrtRootTLSGlobal{nullptr};

emlrtContext emlrtContextGlobal{
    true,                                                 // bFirstTime
    false,                                                // bInitialized
    131643U,                                              // fVersionInfo
    nullptr,                                              // fErrorFunction
    "evaluatePolicy",                                     // fFunctionName
    nullptr,                                              // fRTCallStack
    false,                                                // bDebugMode
    {2045744189U, 2170104910U, 2743257031U, 4284093946U}, // fSigWrd
    nullptr                                               // fSigMem
};

// Function Declarations
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[5];

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *b_nullptr,
                                 const char_T *identifier))[5];

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[5];

static const mxArray *emlrt_marshallOut(const real_T u);

// Function Definitions
//
// Arguments    : const emlrtStack *sp
//                const mxArray *src
//                const emlrtMsgIdentifier *msgId
// Return Type  : real_T (*)[5]
//
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[5]
{
  static const int32_T dims[1]{5};
  real_T(*ret)[5];
  int32_T iv[1];
  boolean_T bv[1]{false};
  emlrtCheckVsBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 1U,
                            (const void *)&dims[0], &bv[0], &iv[0]);
  ret = (real_T(*)[5])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

//
// Arguments    : const emlrtStack *sp
//                const mxArray *b_nullptr
//                const char_T *identifier
// Return Type  : real_T (*)[5]
//
static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *b_nullptr,
                                 const char_T *identifier))[5]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[5];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(sp, emlrtAlias(b_nullptr), &thisId);
  emlrtDestroyArray(&b_nullptr);
  return y;
}

//
// Arguments    : const emlrtStack *sp
//                const mxArray *u
//                const emlrtMsgIdentifier *parentId
// Return Type  : real_T (*)[5]
//
static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[5]
{
  real_T(*y)[5];
  y = b_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

//
// Arguments    : const real_T u
// Return Type  : const mxArray *
//
static const mxArray *emlrt_marshallOut(const real_T u)
{
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateDoubleScalar(u);
  emlrtAssign(&y, m);
  return y;
}

//
// Arguments    : const mxArray * const prhs[1]
//                const mxArray *plhs[1]
// Return Type  : void
//
void evaluatePolicy_api(const mxArray *const prhs[1], const mxArray *plhs[1])
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  real_T(*observation1)[5];
  real_T action1;
  st.tls = emlrtRootTLSGlobal;
  // Marshall function inputs
  observation1 = emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "observation1");
  // Invoke the target function
  action1 = evaluatePolicy(*observation1);
  // Marshall function outputs
  plhs[0] = emlrt_marshallOut(action1);
}

//
// Arguments    : void
// Return Type  : void
//
void evaluatePolicy_atexit()
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  evaluatePolicy_xil_terminate();
  evaluatePolicy_xil_shutdown();
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

//
// Arguments    : void
// Return Type  : void
//
void evaluatePolicy_initialize()
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, nullptr);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

//
// Arguments    : void
// Return Type  : void
//
void evaluatePolicy_terminate()
{
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

//
// File trailer for _coder_evaluatePolicy_api.cpp
//
// [EOF]
//
