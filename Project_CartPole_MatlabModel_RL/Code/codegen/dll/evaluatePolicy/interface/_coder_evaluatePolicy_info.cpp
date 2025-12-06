//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: _coder_evaluatePolicy_info.cpp
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

// Include Files
#include "_coder_evaluatePolicy_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

// Function Declarations
static const mxArray *emlrtMexFcnResolvedFunctionsInfo();

// Function Definitions
//
// Arguments    : void
// Return Type  : const mxArray *
//
static const mxArray *emlrtMexFcnResolvedFunctionsInfo()
{
  const mxArray *nameCaptureInfo;
  const char_T *data[7]{
      "789ced584d8fd240182e664d3cb8dac4ec1e8c476e1b3b2ceb47b8185d0a115d36044ad8"
      "0dd9c05066a1d0e9acedd48027af9ebc7adca3f1e03f32f14778f224"
      "fd180a934cca976c36f00678fbe699becf3333cc53829428141392243d9082f8b61fe4dd"
      "b096c37c479a0e1e4f847987ab59dc0d915d0eff1a669d58140d6850",
      "5810a3f19d6d820d0b5a541b5e21c9460e313fa2b68f5c1a26d20c8c2a93c5a957e1fc04"
      "342e3cc8bbce7691deafb858b2bb4ea4d09c2cc6ebd114cc77479a0e"
      "1ee7835f0f7edca6f0fd5e908ff5ff14c3c7f07af502740946a067a0ae0bad0e5089ee62"
      "645107645d8712fcb44c5a848222a4266c352ad46d0fc3229d4a1f95",
      "6cd2433a05616e64a14d4bc4448d604891b491d9289f80ece802c0cea8af0a295430a4d3"
      "f36d0ae6f370c6f9f2391a7fcfcfc9da7d639d7c5ffefe78b44e3e16"
      "37c53710f49bf5fbba2fe09339fc70e0a819cd39abe6ec22b48e35ab7c449eab918e520c"
      "4f9c0e4950afabff77c1fdb3ae635ed05fe6f07a217791c4fe19b509",
      "a1494009315b64006cd37b1d786f7d74664727161c60ef140393c0b67f9ef336f19f150a"
      "8e747f5e52f7e318dd0cb74d2594a5f8aa145f91ffccf3e3a6fcfa7a"
      "413ed6ff550c1fc3eb85d379f76dbc4293fbd514e859953fb8bf2e5b5ede14ff5b37dfb2"
      "7ebb27e09339fc45ff7da69669554f3e68e7ee615fedbdd40a2969eb",
      "b7ac5f4ed05fe6f005fcd6fff47e2d69c43fc2def1ddfa6d98af17e4dbfaed6af8586c0a"
      "dfd66f57d37f59bf7d2be82f73f85c7e7b454c431f8220058e5bf2af"
      "15bc2abf7d12a39be1137e1bc8510225cc716fabdfbe8ee163f85c7e1bee5bb442d17e35"
      "057a56e50f3ff7fe6cfdf63ff2adebff845a39f5e6fc1de9949e9de5",
      "284deb972ab66ac7b7df6fff0199265025",
      ""};
  nameCaptureInfo = nullptr;
  emlrtNameCaptureMxArrayR2016a(&data[0], 5808U, &nameCaptureInfo);
  return nameCaptureInfo;
}

//
// Arguments    : void
// Return Type  : mxArray *
//
mxArray *emlrtMexFcnProperties()
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *propFieldName[9]{"Version",
                                 "ResolvedFunctions",
                                 "Checksum",
                                 "EntryPoints",
                                 "CoverageInfo",
                                 "IsPolymorphic",
                                 "PropertyList",
                                 "UUID",
                                 "ClassEntryPointIsHandle"};
  const char_T *epFieldName[8]{
      "Name",     "NumberOfInputs", "NumberOfOutputs", "ConstantInputs",
      "FullPath", "TimeStamp",      "Constructor",     "Visible"};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 8, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 1);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("evaluatePolicy"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, "FullPath",
      emlrtMxCreateString("/home/jiehuang/Documents/Custom-Robot/Matlab_Study/"
                          "Matlab2023Project/Project_CartPole_MatlabModel_RL/"
                          "Code/evaluatePolicy.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739927.6715277778));
  emlrtSetField(xEntryPoints, 0, "Constructor",
                emlrtMxCreateLogicalScalar(false));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 9, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("23.2.0.2859533 (R2023b) Update 10"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("qGN6ovokdCgWtng0W3DOt"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

//
// File trailer for _coder_evaluatePolicy_info.cpp
//
// [EOF]
//
