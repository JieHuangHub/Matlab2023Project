/* Copyright 2021-2022 The MathWorks, Inc. */
#ifndef MW_TARGET_TYPES_HPP
#define MW_TARGET_TYPES_HPP

namespace MWTargetType {

enum TARGETTYPE {
    CUDNN_TARGET = 0,
    TENSORRT_TARGET,
    ONEDNN_TARGET,
    ARMNEON_TARGET,
    ARMMALI_TARGET
};

} // namespace MWTargetType

#endif
