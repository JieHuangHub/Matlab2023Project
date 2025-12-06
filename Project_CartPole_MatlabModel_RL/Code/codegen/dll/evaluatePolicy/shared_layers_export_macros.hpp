/* Copyright 2021-2022 The MathWorks, Inc. */
#ifndef SHARED_LAYERS_EXPORT_MACROS
#define SHARED_LAYERS_EXPORT_MACROS

#ifdef SUPPORTS_PRAGMA_ONCE
#pragma once
#endif


#ifdef PRECOMPILE_LAYERFILES

// includes package.h, which has the definition of DLL_EXPORT_SYM
#include "version.h"
#define DLCODER_EXPORT_CLASS DLL_EXPORT_SYM

#else

#define DLCODER_EXPORT_CLASS

#endif // PRECOMPILE_LAYERFILES

#endif
