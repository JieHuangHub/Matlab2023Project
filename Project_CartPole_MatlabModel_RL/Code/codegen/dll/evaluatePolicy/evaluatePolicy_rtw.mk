###########################################################################
## Makefile generated for component 'evaluatePolicy'. 
## 
## Makefile     : evaluatePolicy_rtw.mk
## Generated on : Thu Nov 06 16:20:30 2025
## Final product: ./evaluatePolicy.so
## Product type : dynamic-library
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# DEF_FILE                Definition file

PRODUCT_NAME              = evaluatePolicy
MAKEFILE                  = evaluatePolicy_rtw.mk
MATLAB_ROOT               = /usr/local/MATLAB/R2023b
MATLAB_BIN                = /usr/local/MATLAB/R2023b/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/glnxa64
START_DIR                 = /home/jiehuang/Documents/Custom-Robot/Matlab_Study/Matlab2023Project/Project_CartPole_MatlabModel_RL/Code
TGT_FCN_LIB               = ISO_C++11
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 
RELATIVE_PATH_TO_ANCHOR   = ../../..
DEF_FILE                  = $(PRODUCT_NAME).def
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          NVIDIA CUDA | gmake (64-bit Linux)
# Supported Version(s):    ALL
# ToolchainInfo Version:   2023b
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# ANSI_OPTS
# CPP_ANSI_OPTS

#-----------
# MACROS
#-----------

WARN_FLAGS         = -Wall -W -Wwrite-strings -Winline -Wstrict-prototypes -Wnested-externs -Wpointer-arith -Wcast-align
WARN_FLAGS_MAX     = $(WARN_FLAGS) -Wcast-qual -Wshadow
CPP_WARN_FLAGS     = -Wall -W -Wwrite-strings -Winline -Wpointer-arith -Wcast-align
CPP_WARN_FLAGS_MAX = $(CPP_WARN_FLAGS) -Wcast-qual -Wshadow

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = 

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: NVIDIA CUDA C Compiler Driver
CC = nvcc

# Linker: NVIDIA CUDA C Compiler Driver
LD = nvcc

# C++ Compiler: NVIDIA CUDA C++ Compiler Driver
CPP = nvcc

# C++ Linker: NVIDIA CUDA C++ Compiler Driver
CPP_LD = nvcc

# Archiver: GNU Archiver
AR = ar

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = "$(MEX_PATH)/mex"

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%/bin/glnxa64
MAKE = "$(MAKE_PATH)/gmake"


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -g -G
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g -G
OUTPUT_FLAG         = -o
CPPDEBUG            = -g -G
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g -G
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @rm -f
ECHO                = @echo
MV                  = @mv
RUN                 =

#--------------------------------------
# "Faster Runs" Build Configuration
#--------------------------------------

ARFLAGS              = ruvs
CFLAGS               = -c $(ANSI_OPTS) -rdc=true -Wno-deprecated-gpu-targets -Xcompiler -fPIC -Xcudafe "--display_error_number --diag_suppress=2381 --diag_suppress=unsigned_compare_with_zero" \
                       -O3
CPPFLAGS             = -c $(CPP_ANSI_OPTS) -rdc=true -Wno-deprecated-gpu-targets -Xcompiler -fPIC -Xcudafe "--display_error_number --diag_suppress=2381 --diag_suppress=unsigned_compare_with_zero" \
                       -O3
CPP_LDFLAGS          = -lc -Xnvlink -w -Wno-deprecated-gpu-targets
CPP_SHAREDLIB_LDFLAGS  = -shared -lc -Xlinker --no-undefined -Xnvlink -w -Wno-deprecated-gpu-targets
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = -lc -Xnvlink -w -Wno-deprecated-gpu-targets
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           = -MATLAB_ARCH=$(ARCH) $(INCLUDES) \
                         \
                       COPTIMFLAGS="$(ANSI_OPTS)  \
                       -O3 \
                        $(DEFINES)" \
                         \
                       -silent
MEX_LDFLAGS          = LDFLAGS=='$$LDFLAGS'
MAKE_FLAGS           = -f $(MAKEFILE) -j4
SHAREDLIB_LDFLAGS    = -shared -lc -Xlinker --no-undefined -Xnvlink -w -Wno-deprecated-gpu-targets



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = ./evaluatePolicy.so
PRODUCT_TYPE = "dynamic-library"
BUILD_TYPE = "Dynamic Library"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR)/codegen/dll/evaluatePolicy -I$(START_DIR) -I/usr/local/cuda-12.5/include -I$(MATLAB_ROOT)/extern/include

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -DMW_CUDA_ARCH=890 -DBUILDING_EVALUATEPOLICY
DEFINES_CUSTOM = 
DEFINES_STANDARD = -DMODEL=evaluatePolicy

DEFINES = $(DEFINES_) $(DEFINES_CUSTOM) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(START_DIR)/codegen/dll/evaluatePolicy/MWCNNLayer.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWElementwiseAffineLayer.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWFCLayer.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWInputLayer.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWOutputLayer.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWReLULayer.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWTanhLayer.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWTensorBase.cpp $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnElementwiseAffineLayerImpl.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnFCLayerImpl.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnOutputLayerImpl.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnReLULayerImpl.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnTanhLayerImpl.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWElementwiseAffineLayerImplKernel.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnCNNLayerImpl.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnTargetNetworkImpl.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnLayerImplFactory.cu $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnCustomLayerBase.cu $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy_data.cu $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy_initialize.cu $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy_terminate.cu $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy.cu $(START_DIR)/codegen/dll/evaluatePolicy/dlnetwork.cu $(START_DIR)/codegen/dll/evaluatePolicy/predict.cu

ALL_SRCS = $(SRCS)

###########################################################################
## OBJECTS
###########################################################################

OBJS = MWCNNLayer.o MWElementwiseAffineLayer.o MWFCLayer.o MWInputLayer.o MWOutputLayer.o MWReLULayer.o MWTanhLayer.o MWTensorBase.o MWCudnnElementwiseAffineLayerImpl.o MWCudnnFCLayerImpl.o MWCudnnOutputLayerImpl.o MWCudnnReLULayerImpl.o MWCudnnTanhLayerImpl.o MWElementwiseAffineLayerImplKernel.o MWCudnnCNNLayerImpl.o MWCudnnTargetNetworkImpl.o MWCudnnLayerImplFactory.o MWCudnnCustomLayerBase.o evaluatePolicy_data.o evaluatePolicy_initialize.o evaluatePolicy_terminate.o evaluatePolicy.o dlnetwork.o predict.o

ALL_OBJS = $(OBJS)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = 

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS =  -L"/usr/local/cuda-12.5/lib64" -lcudnn -lcublas -lm -lstdc++

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_ = -Xcompiler -fvisibility=hidden
CFLAGS_CU_OPTS = -arch sm_89 
CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_) $(CFLAGS_CU_OPTS) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_ = -Xcompiler -fvisibility=hidden
CPPFLAGS_CU_OPTS = -arch sm_89 
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_) $(CPPFLAGS_CU_OPTS) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_ = -Xlinker -rpath,/usr/local/cuda-12.5/lib64 -arch sm_89  -lcublas -lcusolver -lcufft -lcurand -lcusparse

CPP_LDFLAGS += $(CPP_LDFLAGS_)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_ = -Xlinker -rpath,/usr/local/cuda-12.5/lib64 -arch sm_89  -lcublas -lcusolver -lcufft -lcurand -lcusparse

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_)

#-----------
# Linker
#-----------

LDFLAGS_ = -Xlinker -rpath,/usr/local/cuda-12.5/lib64 -arch sm_89  -lcublas -lcusolver -lcufft -lcurand -lcusparse

LDFLAGS += $(LDFLAGS_)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_ = -Xlinker -rpath,/usr/local/cuda-12.5/lib64 -arch sm_89  -lcublas -lcusolver -lcufft -lcurand -lcusparse

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_)

###########################################################################
## INLINED COMMANDS
###########################################################################

###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build clean info prebuild download execute


all : build
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


prebuild : 


download : $(PRODUCT)


execute : download


###########################################################################
## FINAL TARGET
###########################################################################

#----------------------------------------
# Create a dynamic library
#----------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS)
	@echo "### Creating dynamic library "$(PRODUCT)" ..."
	$(CPP_LD) $(CPP_SHAREDLIB_LDFLAGS) -o $(PRODUCT) $(OBJS) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : %.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/codegen/dll/evaluatePolicy/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/codegen/dll/evaluatePolicy/%.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/codegen/dll/evaluatePolicy/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCNNLayer.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCNNLayer.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWElementwiseAffineLayer.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWElementwiseAffineLayer.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWFCLayer.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWFCLayer.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWInputLayer.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWInputLayer.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWOutputLayer.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWOutputLayer.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWReLULayer.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWReLULayer.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWTanhLayer.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWTanhLayer.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWTensorBase.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWTensorBase.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnElementwiseAffineLayerImpl.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnElementwiseAffineLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnFCLayerImpl.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnFCLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnOutputLayerImpl.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnOutputLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnReLULayerImpl.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnReLULayerImpl.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnTanhLayerImpl.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnTanhLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWElementwiseAffineLayerImplKernel.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWElementwiseAffineLayerImplKernel.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnCNNLayerImpl.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnCNNLayerImpl.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnTargetNetworkImpl.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnTargetNetworkImpl.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnLayerImplFactory.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnLayerImplFactory.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MWCudnnCustomLayerBase.o : $(START_DIR)/codegen/dll/evaluatePolicy/MWCudnnCustomLayerBase.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


evaluatePolicy_data.o : $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy_data.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


evaluatePolicy_initialize.o : $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy_initialize.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


evaluatePolicy_terminate.o : $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy_terminate.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


evaluatePolicy.o : $(START_DIR)/codegen/dll/evaluatePolicy/evaluatePolicy.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


dlnetwork.o : $(START_DIR)/codegen/dll/evaluatePolicy/dlnetwork.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


predict.o : $(START_DIR)/codegen/dll/evaluatePolicy/predict.cu
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files ..."
	$(RM) $(PRODUCT)
	$(RM) $(ALL_OBJS)
	$(ECHO) "### Deleted all derived files."


