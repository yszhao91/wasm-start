cmake_minimum_required(VERSION 3.0.0)
project(wasm VERSION 0.1.0)

include(CTest)
enable_testing()

include_directories(D:\\emsdk\\upstream\\emscripten\\system\\include)
add_library(wasm wasm.cpp index.cc test.cc) 

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
