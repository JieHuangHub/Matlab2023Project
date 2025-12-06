/* Copyright 2017-2022 The MathWorks, Inc. */

#ifndef MW_CUDNN_CNN_LAYER_IMPL
#define MW_CUDNN_CNN_LAYER_IMPL

#ifdef PRECOMPILE_LAYERFILES
#include "layer/MWCNNLayerImplBase.hpp"
#include "layer/MWTensorBase.hpp"
#include "layer/MWTensor.hpp"
#include "layer/MWCNNLayer.hpp"
#else
#include "MWCNNLayerImplBase.hpp"
#include "MWTensorBase.hpp"
#include "MWTensor.hpp"
#include "MWCNNLayer.hpp"
#endif

#include <cudnn.h>
#include <cublas_v2.h>
#include <map>
#include <cassert>
#include <vector>

#define CUDA_CALL(status) MWCudnnTarget::cuda_call_line_file(status, __LINE__, __FILE__)
#define MALLOC_CALL(msize) MWCudnnTarget::malloc_call_line_file(msize, __LINE__, __FILE__)
#define CUDNN_CALL(status) MWCudnnTarget::cudnn_call_line_file(status, __LINE__, __FILE__)
#define CUBLAS_CALL(status) MWCudnnTarget::cublas_call_line_file(status, __LINE__, __FILE__)
#define CUDA_FREE_CALL(buf) MWCudnnTarget::call_cuda_free(buf, __LINE__, __FILE__)

namespace MWCudnnTarget {

class MWTargetNetworkImpl;

void cuda_call_line_file(cudaError_t, const int, const char*);
void cudnn_call_line_file(cudnnStatus_t, const int, const char*);
float* malloc_call_line_file(size_t, const int, const char*);
const char* cublasGetErrorString(cublasStatus_t);
void cublas_call_line_file(cublasStatus_t, const int, const char*);

void throw_cuda_error(cudaError_t rMMjgjGRAiLVlTlRSByU,
                      const int ZqQxEyCjEixByRZYMkbj,
                      const char* PfisSEEWDaQFynnzlcin);

template <class T>
void call_cuda_free(T* mem, const int ZqQxEyCjEixByRZYMkbj, const char* PfisSEEWDaQFynnzlcin) {
    if (!mem) {
        return;
    }

    cudaError_t rMMjgjGRAiLVlTlRSByU = cudaFree(mem);

    if ((rMMjgjGRAiLVlTlRSByU != cudaSuccess) && (rMMjgjGRAiLVlTlRSByU != cudaErrorCudartUnloading)) {
        throw_cuda_error(rMMjgjGRAiLVlTlRSByU, ZqQxEyCjEixByRZYMkbj, PfisSEEWDaQFynnzlcin);
    }
}


class MWCNNLayerImpl : public MWCNNLayerImplBase {
  public:
    MWCNNLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* ntwk_impl);
    virtual ~MWCNNLayerImpl();
    void predict() = 0;
    void cleanup() = 0;
    void propagateSize() = 0;

    // allocateOutput simply routes to the correct templatized allocateOutputImpl. We need two
    // separate functions because allocateOutput must be pure virtual on the MWCNNLayerImplBase
    // class, and allocateOutputImpl must be templatized. Templatized functions cannot be virtual.
    virtual void allocateOutput(int);
    template <class T>
    void allocateOutputImpl(int);

    // allocate any auxiliary memory needed by the layer
    virtual void allocate() {
    }

    // deallocateOutput simply routes to the correct templatized deallocateOutputImpl. We need two
    // separate functions because deallocateOutput must be pure virtual on the MWCNNLayerImplBase
    // class, and deallocateOutputImpl must be templatized. Templatized functions cannot be virtual.
    virtual void deallocateOutput(int);
    template <class T>
    void deallocateOutputImpl(int);

    void allocateInput(int) {
    }
    void deallocateInput(int) {
    }

    // deallocate any auxiliary memory needed by the layer
    virtual void deallocate() {
    }

    virtual void postSetup() {
    }

    virtual void setLearnables(std::vector<float*>) {
    }

    virtual void resetState() {
    }

    virtual void updateState() {
    }

    template <typename T>
    T* getData(int index = 0);

    MWTargetNetworkImpl* getTargetNetworkImpl() {
        return cQBKlCKXxecGPJrXBXdk;
    }

  protected:
    std::map<int, cudnnTensorDescriptor_t*> jhFUWlztBndwjbXwYNaJ; // output descriptors
    MWTargetNetworkImpl* cQBKlCKXxecGPJrXBXdk;

    float OwscQfaoXJuSJFwXQahz;
    float OumvfgWXDdmsQaciHMHx;
    float OVOphSOolqRQDDoKPwxy;

    float* getZeroPtr();   // Get the pointer to a zero value parameter
    float* getOnePtr();    // Get the pointer to a one value parameter
    float* getNegOnePtr(); // Get the pointer to a negative one value parameter

  protected:
    template <class T>
    static void setDescriptor(cudnnTensorDescriptor_t&, MWTensor<T>*);

    template <class T>
    static cudnnDataType_t getCuDNNDataType();

    cudnnTensorDescriptor_t* getDescriptor(int);
    cudnnTensorDescriptor_t* createAndAddDescriptor(int);

    virtual float* offsetOutputPointer(float* initialPointer, int) {
        return initialPointer;
    }
    virtual signed char* offsetOutputPointer(signed char* initialPointer, int) {
        return initialPointer;
    }

  public:
    static void padInput(float*, int, int, int, int, int, int, int, float*, int);
    static void padInput(signed char*, int, int, int, int, int, int, int, signed char*, int);
    static void
    fillOutputBuffer(signed char*, int, int, int, int, int, int, int, signed char*, int, int);
    static cudnnTensorDescriptor_t getCuDNNDescriptor(MWTensorBase*);
    static void throwAllocationError(const int, const char*);

    static void setDescriptorForINT8(cudnnTensorDescriptor_t&,
                                     MWTensor<signed char>*,
                                     cudnnDataType_t,
                                     cudnnTensorFormat_t);
};

} // namespace MWCudnnTarget

#endif
