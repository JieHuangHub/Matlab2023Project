/* Copyright 2018-2022 The MathWorks, Inc. */

#ifndef MW_KERNEL_HEADERS
#define MW_KERNEL_HEADERS

#ifdef PRECOMPILE_LAYERFILES
#include "layer/shared_layers_export_macros.hpp"
#else
#include "shared_layers_export_macros.hpp"
#endif

/* SSD Merge layer kernel declaration */
void DLCODER_EXPORT_CLASS __global__ ssdMergeLayerImpl(float*,
                                  float*,
                                  int,
                                  int,
                                  int,
                                  int,
                                  int,
                                  long int,
                                  long int,
                                  long int,
                                  long int,
                                  long int);
/* YOLO reorg kernel impl */
void DLCODER_EXPORT_CLASS __global__ YoloReorg2dImpl(const float*,
                                float*,
                                int,
                                int,
                                long int,
                                long int,
                                long int,
                                long int,
                                int,
                                int,
                                int,
                                int,
                                long int BNrGqqHwfmYKIqbDbnjx);


/* YOLO extraction kernel impl */
void DLCODER_EXPORT_CLASS __global__ YoloExtractionImpl(const float*,
                                   float*,
                                   float*,
                                   float*,
                                   int,
                                   int,
                                   long int,
                                   long int,
                                   long int,
                                   long int,
                                   long int,
                                   long int);

/* Exponential kernel impl */
void DLCODER_EXPORT_CLASS __global__ exp_kernel(float*, float*, long int);


/* Max unpooling kernel impl */
void DLCODER_EXPORT_CLASS __global__ MaxUnpoolingImpl(const float*, const float*, float*, int);


/* Clipped ReLU kernel impl */
void DLCODER_EXPORT_CLASS __global__ ClippedReLUImpl_kernel(float*, float*, float, int);

void DLCODER_EXPORT_CLASS __global__ scale_scalar_kernel(const float*, float*, float*, long int);

void DLCODER_EXPORT_CLASS __global__ scale_vector_kernel(const float*, float*, float*, double, double, long int);

void DLCODER_EXPORT_CLASS __global__ scale_matrix2d_kernel(const float*, float*, float*, double, long int);

void DLCODER_EXPORT_CLASS __global__ scale_tensor3d_kernel(const float*, float*, float*, double, long int);

void DLCODER_EXPORT_CLASS __global__ offset_scalar_kernel(float*, float*, float*, long int, bool, int, int);

void DLCODER_EXPORT_CLASS __global__
offset_vector_kernel(float*, float*, float*, double, double, long int, bool, int, int);

void DLCODER_EXPORT_CLASS __global__ offset_matrix2d_kernel(float*, float*, float*, double, long int, bool, int, int);

void DLCODER_EXPORT_CLASS __global__ offset_tensor3d_kernel(float*, float*, float*, double, long int, bool, int, int);

/* LSTM kernel Impl */
void DLCODER_EXPORT_CLASS __global__ expand_batch_kernel(float*, float*, long int, long int);
void DLCODER_EXPORT_CLASS __global__
reset_interleaved_backward_states(float*, float*, int, int, int, int);
void DLCODER_EXPORT_CLASS __global__
interleave_birnn_passes(float*, float*, long int, long int, long int);


/* Leaky ReLU kernel Impl */
void DLCODER_EXPORT_CLASS __global__ leakyReLUImpl(const float*, float*, float, int);

/* WordEmbedding kernel Impl */
void DLCODER_EXPORT_CLASS __global__ wordEmbedding_kernel_vocab(const float*, float*, int, int);
void DLCODER_EXPORT_CLASS __global__ wordEmbedding_kernel_lookup(float*, float*, float*, int, int);

/* crop 2d kernel Impl */
void DLCODER_EXPORT_CLASS __global__ Crop2dImpl(const float*,
                           float*,
                           int,
                           long int,
                           long int,
                           long int,
                           long int,
                           int,
                           int,
                           int,
                           long int);

#endif
