//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: dlnetwork.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

// Include Files
#include "dlnetwork.h"
#include "evaluatePolicy_internal_types.h"
#include "MWCNNLayer.hpp"
#include "MWCudnnTargetNetworkImpl.hpp"
#include "MWElementwiseAffineLayer.hpp"
#include "MWFCLayer.hpp"
#include "MWInputLayer.hpp"
#include "MWOutputLayer.hpp"
#include "MWReLULayer.hpp"
#include "MWTanhLayer.hpp"
#include "MWTensor.hpp"
#include "MWTensorBase.hpp"
#include "stdio.h"
#include <cstdlib>

// Named Constants
const char *errorString{
    "Abnormal termination due to: %s.\nError in %s (line %d)."};

const char *errStringBase{
    "Error during execution of the generated code. %s at line: %d, file: "
    "%s\nExiting program execution ...\n"};

// Function Declarations
static void checkCleanupCudaError(cudaError_t errCode, const char *file,
                                  unsigned int b_line);

static void checkRunTimeError(const char *errMsg, const char *file,
                              unsigned int b_line);

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void model0_0::allocate()
{
  targetImpl->allocate(200, 2);
  for (int idx{0}; idx < 9; idx++) {
    layers[idx]->allocate();
  }
  (static_cast<MWTensor<float> *>(inputTensors[0]))
      ->setData(layers[0]->getLayerOutput(0));
}

//
// Arguments    : void
// Return Type  : void
//
void model0_0::cleanup()
{
  deallocate();
  for (int idx{0}; idx < 9; idx++) {
    layers[idx]->cleanup();
  }
  if (targetImpl) {
    targetImpl->cleanup();
  }
  isInitialized = false;
  checkCleanupCudaError(cudaGetLastError(), __FILE__, __LINE__);
}

//
// Arguments    : void
// Return Type  : void
//
void model0_0::deallocate()
{
  targetImpl->deallocate();
  for (int idx{0}; idx < 9; idx++) {
    layers[idx]->deallocate();
  }
}

//
// Arguments    : void
// Return Type  : void
//
void model0_0::postsetup()
{
  targetImpl->postSetup(layers, numLayers);
}

//
// Arguments    : void
// Return Type  : void
//
void model0_0::resetState()
{
}

//
// Arguments    : void
// Return Type  : void
//
void model0_0::setSize()
{
  for (int idx{0}; idx < 9; idx++) {
    layers[idx]->propagateSize();
  }
  allocate();
  postsetup();
}

//
// Arguments    : void
// Return Type  : void
//
void model0_0::setup()
{
  if (isInitialized) {
    resetState();
  } else {
    targetImpl->preSetup();
    targetImpl->setAutoTune(true);
    (static_cast<MWInputLayer *>(layers[0]))
        ->createInputLayer(targetImpl, inputTensors[0], "CB", 0);
    (static_cast<MWFCLayer *>(layers[1]))
        ->createFCLayer(targetImpl, layers[0]->getOutputTensor(0), 5, 128,
                        "./codegen/dll/evaluatePolicy/cnn_model0_0_fc_1_w.bin",
                        "./codegen/dll/evaluatePolicy/cnn_model0_0_fc_1_b.bin",
                        "CB", 1);
    (static_cast<MWReLULayer *>(layers[2]))
        ->createReLULayer<float, float>(
            targetImpl, layers[1]->getOutputTensor(0), 0, "FLOAT", 1, "CB", 1);
    (static_cast<MWFCLayer *>(layers[3]))
        ->createFCLayer(targetImpl, layers[2]->getOutputTensor(0), 128, 200,
                        "./codegen/dll/evaluatePolicy/cnn_model0_0_fc_2_w.bin",
                        "./codegen/dll/evaluatePolicy/cnn_model0_0_fc_2_b.bin",
                        "CB", 0);
    (static_cast<MWReLULayer *>(layers[4]))
        ->createReLULayer<float, float>(
            targetImpl, layers[3]->getOutputTensor(0), 0, "FLOAT", 1, "CB", 0);
    (static_cast<MWFCLayer *>(layers[5]))
        ->createFCLayer(targetImpl, layers[4]->getOutputTensor(0), 200, 1,
                        "./codegen/dll/evaluatePolicy/cnn_model0_0_fc_3_w.bin",
                        "./codegen/dll/evaluatePolicy/cnn_model0_0_fc_3_b.bin",
                        "CB", 1);
    (static_cast<MWTanhLayer *>(layers[6]))
        ->createTanhLayer(targetImpl, layers[5]->getOutputTensor(0), "CB", 1);
    (static_cast<MWElementwiseAffineLayer *>(layers[7]))
        ->createElementwiseAffineLayer(
            targetImpl, layers[6]->getOutputTensor(0), 1, 1, 1, 1, 1, 1, false,
            -1, -1,
            "./codegen/dll/evaluatePolicy/cnn_model0_0_scaling_scale.bin",
            "./codegen/dll/evaluatePolicy/cnn_model0_0_scaling_offset.bin",
            "CB", 1);
    (static_cast<MWOutputLayer *>(layers[8]))
        ->createOutputLayer(targetImpl, layers[7]->getOutputTensor(0), "CB", 1);
    outputTensors[0] = layers[8]->getOutputTensor(0);
    setSize();
  }
  isInitialized = true;
}

//
// Arguments    : cudaError_t errCode
//                const char *file
//                unsigned int b_line
// Return Type  : void
//
static void checkCleanupCudaError(cudaError_t errCode, const char *file,
                                  unsigned int b_line)
{
  if ((errCode != cudaSuccess) && (errCode != cudaErrorCudartUnloading)) {
    printf(errorString, cudaGetErrorString(errCode), file, b_line);
  }
}

//
// Arguments    : const char *errMsg
//                const char *file
//                unsigned int b_line
// Return Type  : void
//
static void checkRunTimeError(const char *errMsg, const char *file,
                              unsigned int b_line)
{
  printf(errStringBase, errMsg, b_line, file);
  exit(EXIT_FAILURE);
}

//
// Arguments    : int layerIdx
// Return Type  : void
//
void model0_0::activations(int layerIdx)
{
  for (int idx{0}; idx <= layerIdx; idx++) {
    layers[idx]->predict();
  }
}

//
// Arguments    : void
// Return Type  : int
//
int model0_0::getBatchSize()
{
  return inputTensors[0]->getBatchSize();
}

//
// Arguments    : void
// Return Type  : float *
//
float *model0_0::getInputDataPointer()
{
  return (static_cast<MWTensor<float> *>(inputTensors[0]))->getData();
}

//
// Arguments    : int b_index
// Return Type  : float *
//
float *model0_0::getInputDataPointer(int b_index)
{
  return (static_cast<MWTensor<float> *>(inputTensors[b_index]))->getData();
}

//
// Arguments    : int layerIndex
//                int portIndex
// Return Type  : float *
//
float *model0_0::getLayerOutput(int layerIndex, int portIndex)
{
  return layers[layerIndex]->getLayerOutput(portIndex);
}

//
// Arguments    : int layerIndex
//                int portIndex
// Return Type  : int
//
int model0_0::getLayerOutputSize(int layerIndex, int portIndex)
{
  return static_cast<unsigned int>(
             layers[layerIndex]->getOutputTensor(portIndex)->getNumElements()) *
         sizeof(float);
}

//
// Arguments    : int b_index
// Return Type  : float *
//
float *model0_0::getOutputDataPointer(int b_index)
{
  return (static_cast<MWTensor<float> *>(outputTensors[b_index]))->getData();
}

//
// Arguments    : void
// Return Type  : float *
//
float *model0_0::getOutputDataPointer()
{
  return (static_cast<MWTensor<float> *>(outputTensors[0]))->getData();
}

//
// Arguments    : int layerIndex
//                int portIndex
// Return Type  : int
//
int model0_0::getOutputSequenceLength(int layerIndex, int portIndex)
{
  return layers[layerIndex]->getOutputTensor(portIndex)->getSequenceLength();
}

//
// Arguments    : void
// Return Type  : ::model0_0
//
model0_0::model0_0()
{
  numLayers = 9;
  isInitialized = false;
  targetImpl = 0;
  layers[0] = new MWInputLayer;
  layers[0]->setName("input");
  layers[1] = new MWFCLayer;
  layers[1]->setName("fc_1");
  layers[2] = new MWReLULayer;
  layers[2]->setName("relu_1");
  layers[2]->setInPlaceIndex(0, 0);
  layers[3] = new MWFCLayer;
  layers[3]->setName("fc_2");
  layers[4] = new MWReLULayer;
  layers[4]->setName("relu_2");
  layers[4]->setInPlaceIndex(0, 0);
  layers[5] = new MWFCLayer;
  layers[5]->setName("fc_3");
  layers[6] = new MWTanhLayer;
  layers[6]->setName("layer");
  layers[6]->setInPlaceIndex(0, 0);
  layers[7] = new MWElementwiseAffineLayer;
  layers[7]->setName("scaling");
  layers[7]->setInPlaceIndex(0, 0);
  layers[8] = new MWOutputLayer;
  layers[8]->setName("output_scaling");
  layers[8]->setInPlaceIndex(0, 0);
  targetImpl = new MWCudnnTarget::MWTargetNetworkImpl;
  inputTensors[0] = new MWTensor<float>;
  inputTensors[0]->setHeight(1);
  inputTensors[0]->setWidth(1);
  inputTensors[0]->setChannels(5);
  inputTensors[0]->setBatchSize(1);
  inputTensors[0]->setSequenceLength(1);
}

//
// Arguments    : void
// Return Type  : void
//
model0_0::~model0_0()
{
  try {
    if (isInitialized) {
      cleanup();
    }
    for (int idx{0}; idx < 9; idx++) {
      delete layers[idx];
    }
    if (targetImpl) {
      delete targetImpl;
    }
    delete inputTensors[0];
  } catch (...) {
  }
}

//
// Arguments    : model0_0 *obj
// Return Type  : void
//
namespace coder {
namespace internal {
void dlnetwork_delete(model0_0 *obj)
{
  if (obj->isInitialized) {
    obj->cleanup();
  }
}

//
// Arguments    : model0_0 *obj
// Return Type  : void
//
void dlnetwork_setup(model0_0 *obj)
{
  try {
    obj->setup();
  } catch (std::runtime_error const &err) {
    obj->cleanup();
    checkRunTimeError(err.what(), __FILE__, __LINE__);
  } catch (...) {
    obj->cleanup();
    checkRunTimeError("", __FILE__, __LINE__);
  }
}

} // namespace internal
} // namespace coder

//
// File trailer for dlnetwork.cu
//
// [EOF]
//
