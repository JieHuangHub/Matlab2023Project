#include "MWKernelHeaders.hpp"
#include "MWCudnnCommonHeaders.hpp"
#include "MWCudnnElementwiseAffineLayerImpl.hpp"
#include <cmath>
#include <cassert>
#include <cstdio>
 namespace MWCudnnTarget { 
MWElementwiseAffineLayerImpl::MWElementwiseAffineLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int scale_H, int scale_W, int scale_C, int 
offset_H, int offset_W, int offset_C, bool isClipped, int lowerbound, int 
upperbound, const char* pdleXafalaHAmketaFyq, const char* 
gsJtSpgIkTNvahoTFqow) : MWCNNLayerImpl(layer, ntwk_impl) , 
olKGEIcsxmLSoMhRhEtP(NULL) , fYaOQTeunPwVjnhhTECh(NULL) , pFoPPXxxFRbjXXxQWItv(scale_H) 
, pckLLTEdVPoCZLRwyDnM(scale_W) , osBZbKVTgXwTSsGSbdth(scale_C) , 
gTcJMwtYuwiqqUmqvKhT(offset_H) , gcGbhKACQPAogUYXHedj(offset_W) , 
gNROjwaqhxDPvBWUCUcQ(offset_C) , ZDWLzHUkuZuIUZHfbGDY(isClipped) , 
bDTIjtxZiSHtjwzgEluE(lowerbound) , unSXtdjDjpysqxmbIiPv(upperbound) { 
CUDA_CALL(cudaMalloc((void**)&olKGEIcsxmLSoMhRhEtP, sizeof(float) * 
pFoPPXxxFRbjXXxQWItv * pckLLTEdVPoCZLRwyDnM * osBZbKVTgXwTSsGSbdth)); 
CUDA_CALL(cudaMalloc( (void**)&fYaOQTeunPwVjnhhTECh, sizeof(float) * 
gTcJMwtYuwiqqUmqvKhT * gcGbhKACQPAogUYXHedj * gNROjwaqhxDPvBWUCUcQ)); 
loadScale(pdleXafalaHAmketaFyq); loadOffset(gsJtSpgIkTNvahoTFqow); } 
MWElementwiseAffineLayerImpl::~MWElementwiseAffineLayerImpl() { } void 
MWElementwiseAffineLayerImpl::propagateSize() { } void 
MWElementwiseAffineLayerImpl::predict() { MWTensorBase* ipTensorBase = 
getLayer()->getInputTensor(0); MWTensorBase* opTensorBase = 
getLayer()->getOutputTensor(0); MWTensor<float>* ipTensor = 
static_cast<MWTensor<float>*>(ipTensorBase); MWTensor<float>* opTensor = 
static_cast<MWTensor<float>*>(opTensorBase); int WerBmCOBWhvoFbdqfitc = 
ipTensor->getHeight(); int WmXADZOqdcQvtBUvFerh = ipTensor->getWidth(); int 
WOJynDmqVUPWjAGVIuMQ = ipTensor->getChannels(); long int 
YNDVziqpDddiXQKYZZhX = WerBmCOBWhvoFbdqfitc * WmXADZOqdcQvtBUvFerh; long 
int YMNbgnUYZspjMLjwcIOS = YNDVziqpDddiXQKYZZhX * 
WOJynDmqVUPWjAGVIuMQ; long int YGiQICncmsGZkNUyiQyg = ipTensor->getNumElements(); 
long int rlQsibXJSWJVnUVpdNeL = ((YGiQICncmsGZkNUyiQyg + 31) / 32) * 32; int 
shEncNmxJsMuJKwbrwok = (rlQsibXJSWJVnUVpdNeL < 1024) ? rlQsibXJSWJVnUVpdNeL : 1024; 
long int KCudOrFMfgCzUPMcdePX = (YGiQICncmsGZkNUyiQyg + 
shEncNmxJsMuJKwbrwok - 1) / shEncNmxJsMuJKwbrwok; long int 
pbePKOGQbvmzToFbiRkR = pFoPPXxxFRbjXXxQWItv * pckLLTEdVPoCZLRwyDnM * 
osBZbKVTgXwTSsGSbdth; long int gWETwFdWHfKuelmlKNCC = gTcJMwtYuwiqqUmqvKhT * 
gcGbhKACQPAogUYXHedj * gNROjwaqhxDPvBWUCUcQ; assert(pbePKOGQbvmzToFbiRkR <= 
YGiQICncmsGZkNUyiQyg); assert(gWETwFdWHfKuelmlKNCC <= YGiQICncmsGZkNUyiQyg); if 
(pbePKOGQbvmzToFbiRkR == 1) { scale_scalar_kernel<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( ipTensor->getData(), opTensor->getData(), 
olKGEIcsxmLSoMhRhEtP, YGiQICncmsGZkNUyiQyg); } else if (pFoPPXxxFRbjXXxQWItv == 1 && 
pckLLTEdVPoCZLRwyDnM == 1 && pbePKOGQbvmzToFbiRkR > 1) { 
scale_vector_kernel<<<KCudOrFMfgCzUPMcdePX, shEncNmxJsMuJKwbrwok>>>( 
ipTensor->getData(), opTensor->getData(), olKGEIcsxmLSoMhRhEtP, 
YNDVziqpDddiXQKYZZhX, YMNbgnUYZspjMLjwcIOS, 
YGiQICncmsGZkNUyiQyg); } else if (YMNbgnUYZspjMLjwcIOS == 
pbePKOGQbvmzToFbiRkR) { scale_tensor3d_kernel<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( ipTensor->getData(), opTensor->getData(), 
olKGEIcsxmLSoMhRhEtP, YMNbgnUYZspjMLjwcIOS, YGiQICncmsGZkNUyiQyg); } else { 
scale_matrix2d_kernel<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( ipTensor->getData(), opTensor->getData(), 
olKGEIcsxmLSoMhRhEtP, YNDVziqpDddiXQKYZZhX, YGiQICncmsGZkNUyiQyg); } if 
(gWETwFdWHfKuelmlKNCC == 1) { offset_scalar_kernel<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( opTensor->getData(), opTensor->getData(), 
fYaOQTeunPwVjnhhTECh, YGiQICncmsGZkNUyiQyg, ZDWLzHUkuZuIUZHfbGDY, 
bDTIjtxZiSHtjwzgEluE, unSXtdjDjpysqxmbIiPv); } else if (gTcJMwtYuwiqqUmqvKhT 
== 1 && gcGbhKACQPAogUYXHedj == 1 && gWETwFdWHfKuelmlKNCC > 1) { 
offset_vector_kernel<<<KCudOrFMfgCzUPMcdePX, shEncNmxJsMuJKwbrwok>>>( 
opTensor->getData(), opTensor->getData(), fYaOQTeunPwVjnhhTECh, 
YNDVziqpDddiXQKYZZhX, YMNbgnUYZspjMLjwcIOS, 
YGiQICncmsGZkNUyiQyg, ZDWLzHUkuZuIUZHfbGDY, bDTIjtxZiSHtjwzgEluE, 
unSXtdjDjpysqxmbIiPv); } else if (YMNbgnUYZspjMLjwcIOS == 
gWETwFdWHfKuelmlKNCC) { offset_tensor3d_kernel<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( opTensor->getData(), opTensor->getData(), 
fYaOQTeunPwVjnhhTECh, YMNbgnUYZspjMLjwcIOS, YGiQICncmsGZkNUyiQyg, 
ZDWLzHUkuZuIUZHfbGDY, bDTIjtxZiSHtjwzgEluE, unSXtdjDjpysqxmbIiPv); } else { 
offset_matrix2d_kernel<<<KCudOrFMfgCzUPMcdePX, 
shEncNmxJsMuJKwbrwok>>>( opTensor->getData(), opTensor->getData(), 
fYaOQTeunPwVjnhhTECh, YNDVziqpDddiXQKYZZhX, YGiQICncmsGZkNUyiQyg, 
ZDWLzHUkuZuIUZHfbGDY, bDTIjtxZiSHtjwzgEluE, unSXtdjDjpysqxmbIiPv); } return; 
} void MWElementwiseAffineLayerImpl::cleanup() { if (olKGEIcsxmLSoMhRhEtP) { 
CUDA_FREE_CALL(olKGEIcsxmLSoMhRhEtP); olKGEIcsxmLSoMhRhEtP = NULL; } if 
(fYaOQTeunPwVjnhhTECh) { CUDA_FREE_CALL(fYaOQTeunPwVjnhhTECh); fYaOQTeunPwVjnhhTECh = 
NULL; } } void MWElementwiseAffineLayerImpl::loadScale(const char* 
pdleXafalaHAmketaFyq) { FILE* QMgBqCuvjnbWHWiVPEwn = 
MWCNNLayer::openBinaryFile(pdleXafalaHAmketaFyq); assert(QMgBqCuvjnbWHWiVPEwn); long 
int cRtIUoZRPICuQEOZOSzT = pFoPPXxxFRbjXXxQWItv * pckLLTEdVPoCZLRwyDnM * 
osBZbKVTgXwTSsGSbdth; float* KHjdvykTFbUxdfZTFbqy = MALLOC_CALL(sizeof(float) * 
cRtIUoZRPICuQEOZOSzT); MWCNNLayer::call_fread(KHjdvykTFbUxdfZTFbqy, sizeof(float), 
cRtIUoZRPICuQEOZOSzT, QMgBqCuvjnbWHWiVPEwn, pdleXafalaHAmketaFyq); 
CUDA_CALL(cudaMemcpy(olKGEIcsxmLSoMhRhEtP, KHjdvykTFbUxdfZTFbqy, sizeof(float) * 
cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); free(KHjdvykTFbUxdfZTFbqy); 
fclose(QMgBqCuvjnbWHWiVPEwn); } void MWElementwiseAffineLayerImpl::loadOffset(const 
char* gsJtSpgIkTNvahoTFqow) { FILE* QMgBqCuvjnbWHWiVPEwn = 
MWCNNLayer::openBinaryFile(gsJtSpgIkTNvahoTFqow); assert(QMgBqCuvjnbWHWiVPEwn); long 
int cRtIUoZRPICuQEOZOSzT = gTcJMwtYuwiqqUmqvKhT * gcGbhKACQPAogUYXHedj * 
gNROjwaqhxDPvBWUCUcQ; float* KHjdvykTFbUxdfZTFbqy = MALLOC_CALL(sizeof(float) * 
cRtIUoZRPICuQEOZOSzT); MWCNNLayer::call_fread(KHjdvykTFbUxdfZTFbqy, sizeof(float), 
cRtIUoZRPICuQEOZOSzT, QMgBqCuvjnbWHWiVPEwn, gsJtSpgIkTNvahoTFqow); 
CUDA_CALL(cudaMemcpy(fYaOQTeunPwVjnhhTECh, KHjdvykTFbUxdfZTFbqy, sizeof(float) * 
cRtIUoZRPICuQEOZOSzT, cudaMemcpyHostToDevice)); free(KHjdvykTFbUxdfZTFbqy); 
fclose(QMgBqCuvjnbWHWiVPEwn); } } 