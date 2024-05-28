git clone https://github.com/llvm/llvm-project.git

mkdir llvm-project/build
cd llvm-project/build

cmake -G Ninja ../llvm \
   -DLLVM_ENABLE_PROJECTS=mlir \
   -DLLVM_BUILD_EXAMPLES=ON \
   -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
   -DCMAKE_BUILD_TYPE=Release \
   -DLLVM_ENABLE_ASSERTIONS=ON \
   -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
   -DLLVM_ENABLE_LLD=ON \
   -DLLVM_CCACHE_BUILD=ON

cmake --build . --target check-mlir
