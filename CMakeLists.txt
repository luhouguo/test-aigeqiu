cmake_minimum_required(VERSION 3.20)
project(test_aigeqiu C)

set(CMAKE_C_STANDARD 99)

add_executable(test_aigeqiu main.c lib/funcs.c lib/funcs.h)
