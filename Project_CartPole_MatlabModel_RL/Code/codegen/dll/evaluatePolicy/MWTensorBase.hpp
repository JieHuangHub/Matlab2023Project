/* Copyright 2020-2022 The MathWorks, Inc. */
#ifndef MWTENSOR_BASE_HPP
#define MWTENSOR_BASE_HPP

#include "shared_layers_export_macros.hpp"

#include <cstdlib>
#include <string>
#include <cassert>

class MWCNNLayer;

class DLCODER_EXPORT_CLASS MWTensorBase {
  public:
    MWTensorBase()
        : m_owner(NULL)
        , m_srcport(-1)
        , opBufIndex(-1)
        , m_size(5) {

        m_shape[H] = -1;
        m_shape[W] = -1;
        m_shape[C] = -1;
        m_shape[N] = -1;
        m_shape[S] = -1;

        m_dimsLayout[0] = S;
        m_dimsLayout[1] = N;
        m_dimsLayout[2] = C;
        m_dimsLayout[3] = H;
        m_dimsLayout[4] = W;

        m_dlarray_dimsFormat = "";
    };

    MWTensorBase(int height,
                 int width,
                 int channels,
                 int batchsize,
                 int sequencelength,
                 MWCNNLayer* owner,
                 std::string format,
                 int srcport);
    virtual ~MWTensorBase() {}

    enum DIMSLABEL { H = 0, W, C, N, S };

    int getHeight() const {
        return m_shape[H];
    }
    int getWidth() const {
        return m_shape[W];
    }
    int getChannels() const {
        return m_shape[C];
    }
    int getBatchSize() const {
        return m_shape[N];
    }
    int getSequenceLength() const {
        return m_shape[S];
    }
    int getNumElements() const {
        return getHeight() * getWidth() * getChannels() * getBatchSize() * getSequenceLength();
    }
    void setHeight(int height) {
        m_shape[H] = height;
    }
    void setWidth(int width) {
        m_shape[W] = width;
    }
    void setChannels(int channels) {
        m_shape[C] = channels;
    }
    void setBatchSize(int batchSize) {
        m_shape[N] = batchSize;
    }
    void setSequenceLength(int sequenceLength) {
        m_shape[S] = sequenceLength;
    }

    MWCNNLayer* getOwner() const {
        return m_owner;
    }
    int getSourcePortIndex() const {
        return m_srcport;
    }

    void setopBufIndex(int bufIndex) {
        opBufIndex = bufIndex;
    }
    int getopBufIndex() {
        return opBufIndex;
    };

    int getSize() {
        return m_size;
    }

    void getShape(int tensorShape[5]) const;
    void getLayout(DIMSLABEL[]);
    void setLayout(DIMSLABEL[]);
    void getDimsByLayout(DIMSLABEL[], int, int[]);

    /* Utils for format inspection */
    void setDataFormat(const char*);
    void setDataFormat(std::string);
    std::string getDataFormat() const;
    bool hasDimsFormat(const char dim) const;
    bool hasTimeDim() const;
    bool hasSpatialDim() const;
    bool hasCBFormat() const;

    // get strides based on dims
    static void getStrides(const int dims[], int size, int stride[]);
    // get strides for transforming from srcLayout to destLayout
    static void getTransformStrides(const DIMSLABEL srcLayout[],
                                    const DIMSLABEL destLayout[],
                                    const int dims[],
                                    int size,
                                    int strides[]);
    // get permutation order for permuting from srcLayout to destLayout
    static void getPermutationOrder(const DIMSLABEL srcLayout[],
                                    const DIMSLABEL destLayout[],
                                    int size,
                                    int order[]);

    virtual bool isFloat() const = 0;
    virtual bool isInt8() const = 0;

  private:
    MWCNNLayer* m_owner;
    int m_srcport;
    int opBufIndex;

    int m_size;
    DIMSLABEL m_dimsLayout[5];
    int m_shape[5];

    // This is the data format analogous to dlarray format.
    std::string m_dlarray_dimsFormat;
};

#endif

// LocalWords:  dest
