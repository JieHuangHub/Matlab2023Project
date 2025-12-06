/* Copyright 2021-2022 The MathWorks, Inc. */
#ifndef MW_TARGET_NETWORK_IMPL_BASE
#define MW_TARGET_NETWORK_IMPL_BASE

#include <vector>

#include "MWTargetTypes.hpp"
#include "MWLayerImplFactory.hpp"

class MWCNNLayer;

class MWTargetNetworkImplBase {

  protected:
    MWTargetNetworkImplBase(MWTargetType::TARGETTYPE targetType, MWLayerImplFactory* factory)
        : mTargetType(targetType)
        , mLayerImplFactory(factory)
        , numBufs(0) {}

  public:
    virtual ~MWTargetNetworkImplBase() {
        delete mLayerImplFactory;
    } // TODO: create cpp file with this destructor?
    virtual void preSetup() = 0;
    virtual void deallocate() = 0;
    virtual void cleanup() = 0;
    // allocate() and postSetup() have different interfaces per target and thus are not declared
    // here as virtual functions

    MWTargetType::TARGETTYPE getTargetType() const {
        return mTargetType;
    }

    MWLayerImplFactory* getLayerImplFactory() const {
        return mLayerImplFactory;
    }

  protected:
    MWTargetType::TARGETTYPE mTargetType;
    MWLayerImplFactory* mLayerImplFactory;
    int numBufs;
};

#endif
