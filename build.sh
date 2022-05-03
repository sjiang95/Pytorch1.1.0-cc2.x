#!/bin/bash
python3 setup.py clean --all # uncomment this if you want to execute a clean (re)build
export CC=/usr/local/gcc-5.4.0/bin/gcc
export CXX=/usr/local/gcc-5.4.0/bin/g++
export TORCH_CUDA_ARCH_LIST='2.0' # Important! Set this option to 2.1 which is the real cc of 630M resulting in unsupported architecture error when compiling aten/src/THC libs
export CUDA_HOME=/use/local/cuda-8.0
export CUDAHOSTCXX=/usr/local/gcc-5.4.0/bin/gcc
# export NO_MKLDNN=1
export USE_DISTRIBUTED=0
export USE_CUDNN=0
export USE_NCCL=0
export USE_SYSTEM_NCCL=0
export CMAKE_PREFIX_PATH="$(dirname $(which conda))/../" # [anaconda root directory]
export CFLAGS="-Wno-unused-parameter" # suppress "unused parameters warning"
python3 setup.py bdist_wheel
# python3 setup.py install
echo 0